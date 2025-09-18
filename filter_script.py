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

# Filter the DataFrame (e.g., people older than 25 with salary > 60000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 60000)]
print("\nFiltered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)

# Save the filtered DataFrame to a new .py file with a random name
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
filename = f"{random_name}.py"

# Content to save in the .py file
file_content = f"""
import pandas as pd

# Filtered DataFrame
data = {filtered_df.to_dict(orient='list')}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame loaded from file:")
print(filtered_df)
"""

# Write to file
with open(filename, 'w') as f:
    f.write(file_content)

print(f"\nFiltered DataFrame saved to {filename}")