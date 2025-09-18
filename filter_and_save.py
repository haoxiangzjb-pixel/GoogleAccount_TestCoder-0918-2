import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 75000, 30000, 90000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people older than 25 with salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]

print("\nFiltered DataFrame (Age > 25 AND Salary > 40000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_string}.py"

# Save this script to a randomly named .py file
random_filename = generate_random_filename()
print(f"\nSaving to file: {random_filename}")

# In a real scenario, you might want to save the DataFrame itself
# For this example, we're just saving this script
with open(random_filename, 'w') as f:
    f.write('''import pandas as pd

# Sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 75000, 30000, 90000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]
print("\\nFiltered DataFrame (Age > 25 AND Salary > 40000):")
print(filtered_df)
''')

print(f"Script saved to {random_filename}")