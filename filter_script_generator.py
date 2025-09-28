import pandas as pd
import random
import string
import os

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_and_save_filtered_df():
    """Creates a sample DataFrame, filters it, and saves the filter logic to a random .py file."""
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
        'Age': [25, 30, 35, 28, 22],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'],
        'Salary': [50000, 60000, 70000, 65000, 55000]
    }
    df = pd.DataFrame(data)

    # Filter the DataFrame (example: Age > 27)
    filtered_df = df[df['Age'] > 27]

    # Generate a random filename
    filename = generate_random_filename()

    # Define the content for the new Python script
    script_content = f'''import pandas as pd

# This script was generated automatically.
# It contains the logic to create and filter a sample DataFrame.

data = {data}
df = pd.DataFrame(data)

# Filter applied: Age > 27
filtered_df = df[df['Age'] > 27]

print("Filtered DataFrame:")
print(filtered_df)

# You can save the filtered DataFrame to a file like this:
# filtered_df.to_csv('filtered_output.csv', index=False)
'''

    # Write the content to the randomly named file
    with open(filename, 'w') as f:
        f.write(script_content)

    print(f"Successfully created and saved filter logic to {filename}")
    print("\nFiltered DataFrame that was used:")
    print(filtered_df)

if __name__ == "__main__":
    create_and_save_filtered_df()
