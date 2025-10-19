# This file was generated with filtered DataFrame data
import pandas as pd

# Filtered DataFrame (Age < 30)
data = [{'Name': 'Alice', 'Age': 25, 'City': 'New York', 'Salary': 50000}, {'Name': 'David', 'Age': 28, 'City': 'Tokyo', 'Salary': 55000}, {'Name': 'Eva', 'Age': 22, 'City': 'Sydney', 'Salary': 45000}, {'Name': 'Henry', 'Age': 29, 'City': 'Rome', 'Salary': 58000}]

# Convert back to DataFrame
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame loaded from generated file:")
print(filtered_df)
