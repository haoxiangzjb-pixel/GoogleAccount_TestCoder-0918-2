import pandas as pd

# Filtered DataFrame
data = [{'Name': 'Bob', 'Age': 32, 'City': 'London', 'Salary': 85000}, {'Name': 'David', 'Age': 47, 'City': 'Tokyo', 'Salary': 120000}]

filtered_df = pd.DataFrame(data)
print('Filtered DataFrame:')
print(filtered_df)
