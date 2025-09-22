import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [70000, 85000, 50000, 120000, 65000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 25 with salary > 60000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 60000)]

print("\nFiltered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)