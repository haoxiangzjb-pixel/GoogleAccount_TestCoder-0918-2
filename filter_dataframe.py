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

# Filter the DataFrame (example: people older than 25 with salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]

print("\nFiltered DataFrame (Age > 25 AND Salary > 40000):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame Results\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n")
    f.write(f"# Data filtered by: Age > 25 AND Salary > 40000\n")

print(f"\nFiltered data saved to {random_filename}")