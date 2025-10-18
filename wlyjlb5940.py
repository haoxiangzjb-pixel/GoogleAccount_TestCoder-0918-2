# This file was randomly generated
import pandas as pd

# Filtered DataFrame saved as a dictionary
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Sydney', 'Salary': 65000}]

# Convert back to DataFrame
df_from_file = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from randomly named file:")
print(df_from_file)
