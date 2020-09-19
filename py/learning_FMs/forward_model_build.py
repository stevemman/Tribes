import pandas as pd
import tensorflow as tf
from scipy.stats import norm

tf.logging.set_verbosity(tf.logging.INFO)
data_folder = "./data/build/"
models_folder = "./models/build/"

# Read in the dataset created by "create_build_dataset.py".
df = pd.read_csv(data_folder + "build_dataset.csv")
dataset_size_original = len(df.index)

# Declare the columns we are interested in.
# columns = ["old_terrain_source", "old_terrain_target", "old_hp_source", "old_attack_source", "old_defence_source",
#            "old_hp_target", "old_attack_target", "old_defence_target", "new_hp_source", "new_hp_target"]

# The input features.
feature_names = ["building", "n1", "n2", "n3", "n4", "n5", "n6", "n7",
                 "n8", "old_population", "old_production", "old_level"]

# What we want to predict.
target_population = ["pop_change"]
target_production = ["prod_change"]

# We now shuffle the data
df = df.sample(frac=1, random_state=190561673).reset_index(drop=True)

# Split the data into train, eval, and test sets with 80/10/10 split.
dataset_size_filtered = len(df.index)
train_end = int(dataset_size_filtered * 0.8)
validation_end = train_end + int(dataset_size_filtered * 0.1)

train_frame = df.loc[:train_end].reset_index(drop=True)
X_train = train_frame.loc[:, feature_names]
y_train_pop = train_frame.loc[:, target_population]
y_train_pro = train_frame.loc[:, target_production]
validation_frame = df.loc[train_end:validation_end].reset_index(drop=True)
X_eval = validation_frame.loc[:, feature_names]
y_eval_pop = validation_frame.loc[:, target_population]
y_eval_pro = validation_frame.loc[:, target_production]
test_frame = df.loc[validation_end:].reset_index(drop=True)
print(len(df.index))
# Free memory.
del df

# Write the resulting sets to CSV files.
train_frame.to_csv(data_folder + 'train.csv', index=False)
validation_frame.to_csv(data_folder + 'validation.csv', index=False)
test_frame.to_csv(data_folder + 'test.csv', index=False)

# We normalize the data so we have a normal distribution around 0 and a standard deviation of 1. We do not normalize
# the data directly, we just save the parameters for normalization and let our Estimator features perform normalization.
name_to_normalization = {}

for column in train_frame:
    mu, sigma = norm.fit(train_frame[column])
    min_value = train_frame[column].min()
    max_value = train_frame[column].max()
    name_to_normalization[column] = {"mu": mu, "sigma": sigma, "min": min_value, "max": max_value}


# Estimators need an input_fn for training and validation,this is the function that will provide the Tensorflow nodes
# for the input.
def make_input_fn(data_df, label_df, num_epochs=10, shuffle=True, batch_size=32):
    def input_function():
        ds = tf.data.Dataset.from_tensor_slices((dict(data_df), label_df))
        if shuffle:
            ds = ds.shuffle(1024)
        ds = ds.batch(batch_size).repeat(num_epochs)
        return ds

    return input_function


train_input_fn_pop = make_input_fn(X_train, y_train_pop)
train_input_fn_pro = make_input_fn(X_train, y_train_pro)
eval_input_fn_pop = make_input_fn(X_eval, y_eval_pop, num_epochs=1, shuffle=False)
eval_input_fn_pro = make_input_fn(X_eval, y_eval_pro, num_epochs=1, shuffle=False)


# train_input_fn = tf.estimator.inputs.pandas_input_fn(X_train, y_train, batch_size=8, num_epochs=100, shuffle=True)
# eval_input_fn = tf.estimator.inputs.pandas_input_fn(X_eval, y_eval, batch_size=8, num_epochs=1, shuffle=False)


# Now we need to define for our Estimators what the input_fn delivers and how to treat / preprocess it.
def build_normalizer_fn(feature_name, normalization):
    def normalizer_fn(tensor):
        with tf.name_scope(feature_name + '_normalize'):
            clipped = tf.clip_by_value(tensor, normalization["min"], normalization["max"])
            return (clipped - normalization["mu"]) / normalization["sigma"]

    return normalizer_fn


# Append all feature columns with appropriate normalization.
feature_columns = []
for feature_name in feature_names:
    feature_columns.append(tf.feature_column.numeric_column(
        feature_name,
        normalizer_fn=build_normalizer_fn(feature_name, name_to_normalization[feature_name])
    ))
print(feature_columns)

# Classification with population as target using Neural Network.
dnn_classifier_pop = tf.estimator.DNNClassifier(feature_columns=feature_columns, n_classes=7, hidden_units=[128, 64, 32])
dnn_classifier_pop.train(train_input_fn_pop)

# Classification with production as target using Neural Network.
dnn_classifier_pro = tf.estimator.DNNClassifier(feature_columns=feature_columns, n_classes=18, hidden_units=[128, 64, 32])
dnn_classifier_pro.train(train_input_fn_pro)

# Evaluate Classifier for population.
result = dnn_classifier_pop.evaluate(eval_input_fn_pop)
print(result)

# Evaluate Classifier for production.
result = dnn_classifier_pro.evaluate(eval_input_fn_pro)
print(result)

# Export as a Saved Model so that we can load it from the Tensorflow Java Library.
feature_spec = {}

for feature_name in feature_names:
    feature_spec[feature_name] = tf.placeholder(tf.float32, shape=[None], name=feature_name)

serving_input_fn = tf.estimator.export.build_raw_serving_input_receiver_fn(feature_spec)
dnn_classifier_pop.export_saved_model("./models/build/pop", serving_input_fn)
dnn_classifier_pro.export_saved_model("./models/build/pro", serving_input_fn)
