# This file contains the filtered DataFrame
import pandas as pd

# Filtered DataFrame as a Python dictionary
filtered_data = [{'Name': 'Bob', 'Age': 32, 'City': 'London', 'Salary': 65000}, {'Name': 'David', 'Age': 47, 'City': 'Tokyo', 'Salary': 80000}, {'Name': 'Frank', 'Age': 35, 'City': 'Berlin', 'Salary': 70000}, {'Name': 'Grace', 'Age': 29, 'City': 'Madrid', 'Salary': 55000}, {'Name': 'Henry', 'Age': 53, 'City': 'Rome', 'Salary': 90000}]

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
