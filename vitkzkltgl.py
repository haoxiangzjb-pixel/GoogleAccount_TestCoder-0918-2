import pandas as pd

# Original data
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 75000, 30000, 90000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filtered data (Age > 25 and Salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]
print("\nFiltered DataFrame:")
print(filtered_df)
