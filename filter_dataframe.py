import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
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

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(length))
    return f"{random_string}.py"

# Create the content for the new .py file
output_content = f"""
import pandas as pd

# Filtered DataFrame
filtered_data = {filtered_df.to_dict('records')}

filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame saved in this file:")
print(filtered_df)
"""

# Generate random filename and save
random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(output_content)

print(f"\nFiltered DataFrame saved to: {random_filename}")