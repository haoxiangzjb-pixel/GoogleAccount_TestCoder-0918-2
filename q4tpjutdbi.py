# Filtered DataFrame saved to this file

import pandas as pd

# Data as a dictionary
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'Los Angeles', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Chicago', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Chicago', 'Salary': 65000}]

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
