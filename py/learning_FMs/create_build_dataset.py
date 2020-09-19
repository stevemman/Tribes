import pandas as pd

df = pd.read_csv("./data/data.csv", dtype="int32")

pop_change = df.apply(lambda x : x["new_population"] - x["old_population"], axis=1)
prod_change = df.apply(lambda x : x["new_production"] - x["old_production"], axis=1)

df["pop_change"] = pop_change
df["prod_change"] = prod_change

df.to_csv("./build_dataset.csv", index=False)