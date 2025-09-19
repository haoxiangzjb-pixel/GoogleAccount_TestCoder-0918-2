import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 32],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 30)
filtered_df = df[df['Age'] > 30]

print("\nFiltered DataFrame (Age > 30):")
print(filtered_df)

# Save the filtered DataFrame to a new file
# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Create the content for the new file
file_content = f"""
import pandas as pd

# Filtered DataFrame (Age > 30)
data = {filtered_df.to_dict('records')}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame:")
print(filtered_df)
"""

# Write to the randomly named file
with open(random_filename, 'w') as f:
    f.write(file_content)

print(f"\nFiltered DataFrame saved to {random_filename}")