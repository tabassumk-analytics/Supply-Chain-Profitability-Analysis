import pandas as pd

# Load Global Superstore Dataset
df = pd.read_csv('Global_Superstore.csv', encoding='ISO-8859-1')

# 1. Data Cleaning: Handling nulls and formatting dates
df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Ship Date'] = pd.to_datetime(df['Ship Date'])
df['Postal Code'] = df['Postal Code'].fillna(0)

# 2. Engineering Metrics: Calculating Actual Shipping Days
df['Actual_Shipping_Days'] = (df['Ship Date'] - df['Order Date']).dt.days

# 3. Exporting for SQL Ingestion
df.to_csv('cleaned_supply_chain_data.csv', index=False)
print("Data cleaning complete. Ready for PostgreSQL ingestion.")
