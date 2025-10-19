import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 45, 33, 29],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
}

df = pd.DataFrame(data)

# Filter the DataFrame - for example, people with age less than 30
filtered_df = df[df['Age'] < 30]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age < 30):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Create content for the new Python file
file_content = f'''# This file was generated with filtered DataFrame data
import pandas as pd

# Filtered DataFrame (Age < 30)
data = {filtered_df.to_dict('records')}

# Convert back to DataFrame
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame loaded from generated file:")
print(filtered_df)
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as file:
    file.write(file_content)

print(f"\nFiltered DataFrame has been saved to '{random_filename}'")