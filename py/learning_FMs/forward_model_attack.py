from scipy.stats import norm
import tensorflow as tf
import pandas as pd
import numpy as np

tf.logging.set_verbosity(tf.logging.INFO)
data_folder = "./data/"
models_folder = "./models/"
# tf.get_logger().setLevel("INFO")
# Read in the dataset created by "create_dataset.py".
df = pd.read_csv(data_folder + "data.csv")
dataset_size_original = len(df.index)

# Declare the columns we are interested in.
# columns = ["old_terrain_source", "old_terrain_target", "old_hp_source", "old_attack_source", "old_defence_source",
#            "old_hp_target", "old_attack_target", "old_defence_target", "new_hp_source", "new_hp_target"]

# The input features.
feature_names = ["old_terrain_source", "old_terrain_target", "old_hp_source", "old_attack_source", "old_defence_source",
                 "old_hp_target", "old_attack_target", "old_defence_target"]

# What we want to predict.
classification_output_features = ["result"]
regression_output_features = ["new_hp_source", "new_hp_target"]

# Discard rows that start the action with 0 hp.
df = df.loc[(df["old_hp_source"] > 0.0) & (df["old_hp_target"] > 0.0)]

# We now shuffle the data
df = df.sample(frac=1, random_state=190561673).reset_index(drop=True)

# Split the data into train, eval, and test sets with 80/10/10 split.
dataset_size_filtered = len(df.index)
train_end = int(dataset_size_filtered * 0.8)
validation_end = train_end + int(dataset_size_filtered * 0.1)

train_frame = df.loc[:train_end].reset_index(drop=True)
X_train = train_frame.loc[:, feature_names]
y_train_classification = train_frame.loc[:, classification_output_features]
y_train_regression = train_frame.loc[:, regression_output_features]
validation_frame = df.loc[train_end:validation_end].reset_index(drop=True)
X_eval = validation_frame.loc[:, feature_names]
y_eval_classification = validation_frame.loc[:, classification_output_features]
y_eval_regression = validation_frame.loc[:, regression_output_features]
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


train_input_fn_classification = make_input_fn(X_train, y_train_classification)
train_input_fn_regression = make_input_fn(X_train, y_train_regression)
eval_input_fn_classification = make_input_fn(X_eval, y_eval_classification, num_epochs=1, shuffle=False)
eval_input_fn_regression = make_input_fn(X_eval, y_eval_regression, num_epochs=1, shuffle=False)


# train_input_fn = tf.estimator.inputs.pandas_input_fn(X_train, y_train, batch_size=8, num_epochs=100, shuffle=True)
# eval_input_fn = tf.estimator.inputs.pandas_input_fn(X_eval, y_eval, batch_size=8, num_epochs=1, shuffle=False)


# Now we need to define for our Estimators what the input_fn delivers and how to treat / preprocess it.
def build_normalizer_fn(feature_name, normalization):
    def normalizer_fn(tensor):
        with tf.name_scope(feature_name + '_normalize'):
            clipped = tf.clip_by_value(tensor, normalization["min"], normalization["max"])
            return (clipped - normalization["mu"]) / normalization["sigma"]

    return normalizer_fn


# Terrain type needs no normalization.
feature_columns = [tf.feature_column.numeric_column('old_terrain_source'),
                   tf.feature_column.numeric_column('old_terrain_target')]
# Append all other feature columns with appropriate normalization.
for feature_name in feature_names[2:]:
    feature_columns.append(tf.feature_column.numeric_column(
        feature_name,
        normalizer_fn=build_normalizer_fn(feature_name, name_to_normalization[feature_name])
    ))
print(feature_columns)

# # Linear regression using a pre-built estimator.
# linear_regressor = tf.estimator.LinearRegressor(feature_columns=feature_columns)
# linear_regressor.train(train_input_fn)
# result = linear_regressor.evaluate(eval_input_fn)
# print(result)

# Regression using Neural Network.
dnn_regressor = tf.estimator.DNNRegressor(feature_columns=feature_columns, label_dimension=2, hidden_units=[128, 64, 32])
dnn_regressor.train(train_input_fn_regression)


# # Classification using Linear Classifier.
# linear_classifier = tf.estimator.LinearClassifier(feature_columns=feature_columns, n_classes=3)
# linear_classifier.train(train_input_fn)
# result = linear_classifier.evaluate(eval_input_fn)
# print(result)

# # Classification using Neural Network.
# dnn_classifier = tf.estimator.DNNClassifier(feature_columns=feature_columns, n_classes=3, hidden_units=[256, 128, 64])
# dnn_classifier.train(train_input_fn_classification)

# Evaluate Regressor.
result = dnn_regressor.evaluate(eval_input_fn_regression)
print(result)

# # Evaluate Classifier.
# result = dnn_classifier.evaluate(eval_input_fn_classification)
# print(result)


# # Export as a Saved Model so that we can load it from the Tensorflow Java Library.
# feature_spec = {"old_terrain_source": tf.placeholder(tf.string, shape=[None], name="old_terrain_source"),
#                 "old_terrain_target": tf.placeholder(tf.string, shape=[None], name="old_terrain_target")}
#
# for feature_name in feature_names:
#     feature_spec[feature_name] = tf.placeholder(tf.float32, shape=[None], name=feature_name)
#
# serving_input_fn = tf.estimator.export.build_raw_serving_input_receiver_fn(feature_spec)
# dnn_regressor.export_saved_model("./models/regressor", serving_input_fn)
# dnn_classifier.export_saved_model("./models/classifier", serving_input_fn)

# def build_input_fn(file_path, perform_shuffle=False, epochs=1, batch_size=32):
#     def decode_csv(line_tensor):
#         """Builds nodes that process one line of CSV. The input is *not*
#         a string, but a tensor providing the strings when the graph is run.
#         We do not parse anything here but build a subgraph that will do the parsing."""
#         parsed_line_tensors = tf.io.decode_csv(line_tensor, [[""],
#             [0.], [0.], [0.], [0.], [0.],
#             [0.], [0.], [0.], [0.]], name='csv_parser')
#         # Last element is the label
#         label = parsed_line_tensors[-1:]
#         # remove label from list
#         del parsed_line_tensors[-1]
#         # Everything remaining are the features
#         features = parsed_line_tensors[1:]
#         features_and_label = (dict(zip(feature_names, features)), label)
#         print(features_and_label)
#         return features_and_label
#
#     # build a dataset that uses the helper function to parse the input
#     dataset = (
#         # Create a dataset based on a text file.
#         tf.data.TextLineDataset(file_path)
#             # Skip header row.
#             .skip(1)
#             # Transform each elem by inserting the result of decode_csv.
#             .map(decode_csv)
#     )
#
#     if perform_shuffle:
#         # Randomizes input using a window of 1024 elements (those are read into memory).
#         dataset = dataset.shuffle(buffer_size=1024)
#
#     dataset = (dataset
#                # Repeats dataset this many times.
#                .repeat(epochs)
#                # Batch size to use.
#                .batch(batch_size)
#                )
#
#     # Now return a function that uses a reference to our dataset
#     # to provide new data on each call.
#     def input_fn():
#         iterator = tf.compat.v1.data.make_one_shot_iterator(dataset)
#         batch_features, batch_labels = iterator.get_next()
#         return batch_features, batch_labels
#
#     return input_fn
