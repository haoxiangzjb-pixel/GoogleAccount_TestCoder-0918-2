import pandas as pd
import random
import string

def generate_random_filename(length=8, prefix="filtered_data_", suffix=".csv"):
    """Generates a random filename."""
    random_chars = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f"{prefix}{random_chars}{suffix}"

# Create sample data
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: filter for Age > 30)
filtered_df = df[df['Age'] > 30]

# Generate a random filename
random_filename = generate_random_filename()

# Save the filtered DataFrame
filtered_df.to_csv(random_filename, index=False)

print(f"Original DataFrame:\n{df}")
print(f"\nFiltered DataFrame (Age > 30):\n{filtered_df}")
print(f"\nFiltered data saved to: {random_filename}")

# Now, let's create a Python script that contains the core filtering logic
script_content = '''import pandas as pd

# Load your data from a source (e.g., CSV, database)
# df = pd.read_csv('your_data_source.csv')

# Example DataFrame creation for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Apply your filter condition here
filtered_df = df[df['Age'] > 30]  # Example condition

# Save the filtered DataFrame to a file
# Generate a random filename for the output
import random
import string
random_filename = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(8)) + '.csv'
filtered_df.to_csv(random_filename, index=False)

print(f"Filtered data saved to: {{random_filename}}')
'''

# Write the script content to a randomly named .py file
random_script_filename = generate_random_filename(length=10, prefix="script_", suffix=".py")
with open(random_script_filename, 'w') as f:
    f.write(script_content)

print(f"\nThe Python script for filtering has been saved to: {random_script_filename}")
