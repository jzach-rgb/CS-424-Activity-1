import pandas as pd

df = pd.read_csv("cs424assignment1.csv")

df = df.drop(columns=["Customer ID", "Customer Name", "Customer Reference ID",
                      "PAN Suffix", "Payment ID", "Transaction ID", "Token",
                      "Notes", "Details", "Fulfillment Note", "Card Brand"])

df.to_csv("sanitized_raw_data.csv", index=False)