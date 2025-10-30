import pandas as pd
import random
import string
import os

def generate_random_filename(extension='.py'):
    """Generate a random filename with the specified extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"

def filter_and_save_dataframe():
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 32, 18, 47, 22, 35, 29, 53],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
        'Salary': [50000, 65000, 30000, 80000, 45000, 70000, 55000, 90000]
    }
    
    df = pd.DataFrame(data)
    print("Original DataFrame:")
    print(df)
    print("\n")
    
    # Filter the DataFrame (for example, people older than 25 with salary > 50000)
    filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 50000)]
    
    print("Filtered DataFrame (Age > 25 and Salary > 50000):")
    print(filtered_df)
    print("\n")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the filtered DataFrame to the randomly named .py file
    with open(random_filename, 'w') as file:
        file.write("# This file contains the filtered DataFrame\n")
        file.write("import pandas as pd\n\n")
        file.write("# Filtered DataFrame as a Python dictionary\n")
        file.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
        file.write("# Convert to DataFrame\n")
        file.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
        file.write("print('Filtered DataFrame:')\n")
        file.write("print(df_filtered)\n")
    
    print(f"Filtered DataFrame saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    filter_and_save_dataframe()