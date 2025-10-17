# Filtered DataFrame saved to this file

import pandas as pd

# Data from filtered DataFrame
filtered_data = [{'Name': 'Bob', 'Age': 32, 'City': 'London', 'Salary': 65000}, {'Name': 'David', 'Age': 47, 'City': 'Tokyo', 'Salary': 80000}, {'Name': 'Frank', 'Age': 38, 'City': 'London', 'Salary': 70000}, {'Name': 'Grace', 'Age': 29, 'City': 'Sydney', 'Salary': 55000}, {'Name': 'Henry', 'Age': 51, 'City': 'Berlin', 'Salary': 85000}]

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
