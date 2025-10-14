import pandas as pd
import random
import string
import os

def generate_random_filename(ext='py', length=10):
    """Generates a random filename with a given extension."""
    letters = string.ascii_lowercase
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}.{ext}"

def create_filter_script():
    """Creates a Python script that filters a DataFrame."""
    script_content = '''import pandas as pd

# Sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame: Select people older than 26
filtered_df = df[df['Age'] > 26]

print("Filtered DataFrame:")
print(filtered_df)

# Save the filtered DataFrame to a new CSV file
filtered_df.to_csv('filtered_output.csv', index=False)
print("\\nFiltered DataFrame saved to 'filtered_output.csv'.")
'''

    # Generate a random filename
    random_filename = generate_random_filename()

    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Python script generated and saved as: {random_filename}")
    return random_filename

if __name__ == "__main__":
    generated_file = create_filter_script()
    print(f"Generated script filename: {generated_file}")