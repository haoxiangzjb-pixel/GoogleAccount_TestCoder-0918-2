
import pandas as pd

# Filtered DataFrame
filtered_data = [{'Name': 'Bob', 'Age': 32, 'City': 'London', 'Salary': 85000}, {'Name': 'David', 'Age': 47, 'City': 'Tokyo', 'Salary': 120000}]

filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame saved in this file:")
print(filtered_df)
