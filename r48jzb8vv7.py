# Filtered DataFrame saved to this file
import pandas as pd

# Data as a dictionary
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'Los Angeles', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Chicago', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Phoenix', 'Salary': 65000}]

# Convert to DataFrame
df = pd.DataFrame(filtered_data)
print('Filtered DataFrame:')
print(df)
