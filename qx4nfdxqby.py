import pandas as pd

# Filtered DataFrame
data = {
    'Name': ['David', 'Henry'],
    'Age': [28, 27],
    'City': ['Tokyo', 'Rome'],
    'Salary': [55000, 58000]
}

filtered_df = pd.DataFrame(data)

print("Filtered DataFrame:")
print(filtered_df)
print()
print("DataFrame Info:")
print(f"Shape: {filtered_df.shape}")
print(f"Columns: {list(filtered_df.columns)}")
