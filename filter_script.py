import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'],
    'Age': [25, 30, 35, 28, 32, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 58000]
}

df = pd.DataFrame(data)

# Filter the DataFrame - for example, people older than 28
filtered_df = df[df['Age'] > 28]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 28):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Create content for the new file
file_content = f'''# This file was randomly generated
import pandas as pd

# Filtered DataFrame saved as a dictionary
filtered_data = {filtered_df.to_dict('records')}

# Convert back to DataFrame
df_from_file = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from randomly named file:")
print(df_from_file)
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(file_content)

print(f"\nFiltered DataFrame has been saved to '{random_filename}'")
print(f"File exists: {os.path.exists(random_filename)}")