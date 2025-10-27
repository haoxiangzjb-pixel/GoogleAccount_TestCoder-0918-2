# Filtered DataFrame saved to this file

import pandas as pd

filtered_data =       Name  Age    City  Salary
# 1      Bob   30  London   60000
# 2  Charlie   35   Paris   70000
# 4      Eve   32  Sydney   65000
# 6    Grace   31    Rome   68000

filtered_dict = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Sydney', 'Salary': 65000}, {'Name': 'Grace', 'Age': 31, 'City': 'Rome', 'Salary': 68000}]
filtered_df = pd.DataFrame(filtered_dict)
print('Filtered DataFrame:')
print(filtered_df)
