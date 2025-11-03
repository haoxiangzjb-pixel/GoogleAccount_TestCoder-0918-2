# Filtered DataFrame saved to this file
import pandas as pd

# Data as a dictionary
filtered_data = [{'Name': 'Alice', 'Age': 25, 'City': 'New York', 'Salary': 50000}, {'Name': 'David', 'Age': 28, 'City': 'Tokyo', 'Salary': 55000}, {'Name': 'Eve', 'Age': 22, 'City': 'Sydney', 'Salary': 45000}, {'Name': 'Henry', 'Age': 27, 'City': 'Madrid', 'Salary': 58000}]

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
