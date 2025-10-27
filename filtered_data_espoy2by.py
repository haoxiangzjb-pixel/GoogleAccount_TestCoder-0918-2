# Filtered DataFrame saved to this file

import pandas as pd

filtered_dict = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Sydney', 'Salary': 65000}, {'Name': 'Grace', 'Age': 31, 'City': 'Rome', 'Salary': 68000}]
filtered_df = pd.DataFrame(filtered_dict)
print('Filtered DataFrame:')
print(filtered_df)
