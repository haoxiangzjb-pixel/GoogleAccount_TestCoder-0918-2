import pandas as pd
import random
import string
import os

# Function to generate a random filename
def generate_random_filename(extension):
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.{extension}"

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'age': [25, 32, 18, 47, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'salary': [50000, 75000, 30000, 90000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people older than 25 with salary > 40000)
filtered_df = df[(df['age'] > 25) & (df['salary'] > 40000)]

print("\nFiltered DataFrame (age > 25 and salary > 40000):")
print(filtered_df)

# Generate a random filename for the CSV output
csv_filename = generate_random_filename("csv")
filtered_df.to_csv(csv_filename, index=False)
print(f"\nFiltered data saved to '{csv_filename}'")

# Also save this script to a randomly named .py file
script_filename = generate_random_filename("py")
with open(__file__, 'r') as current_script:
    script_content = current_script.read()
    
with open(script_filename, 'w') as new_script:
    new_script.write(script_content)
    
print(f"This script has been copied to '{script_filename}'")