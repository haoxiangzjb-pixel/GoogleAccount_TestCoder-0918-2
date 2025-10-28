# Filtered DataFrame saved to this file
import pandas as pd

# Data from filtered DataFrame
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Frank', 'Age': 33, 'City': 'Berlin', 'Salary': 65000}, {'Name': 'Henry', 'Age': 31, 'City': 'Rome', 'Salary': 68000}]

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
