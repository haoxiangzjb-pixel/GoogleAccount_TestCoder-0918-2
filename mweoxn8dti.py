import pandas as pd

# This script was generated automatically.
# It contains the logic to create and filter a sample DataFrame.

data = {'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'], 'Age': [25, 30, 35, 28, 22], 'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'], 'Salary': [50000, 60000, 70000, 65000, 55000]}
df = pd.DataFrame(data)

# Filter applied: Age > 27
filtered_df = df[df['Age'] > 27]

print("Filtered DataFrame:")
print(filtered_df)

# You can save the filtered DataFrame to a file like this:
# filtered_df.to_csv('filtered_output.csv', index=False)
