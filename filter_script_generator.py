import pandas as pd
import random
import string
import os

def create_filtered_dataframe_script():
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 30, 35, 28, 22, 40, 33, 27],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
        'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
    }
    
    df = pd.DataFrame(data)
    
    # Filter the DataFrame: People with age less than 30 and salary greater than 50000
    filtered_df = df[(df['Age'] < 30) & (df['Salary'] > 50000)]
    
    # Generate a random filename for the .py file
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Create the script content that will recreate the filtered DataFrame
    script_content = f'''import pandas as pd

# Filtered DataFrame
data = {{
    'Name': {filtered_df['Name'].tolist()},
    'Age': {filtered_df['Age'].tolist()},
    'City': {filtered_df['City'].tolist()},
    'Salary': {filtered_df['Salary'].tolist()}
}}

filtered_df = pd.DataFrame(data)

print("Filtered DataFrame:")
print(filtered_df)
print()
print("DataFrame Info:")
print(f"Shape: {{filtered_df.shape}}")
print(f"Columns: {{list(filtered_df.columns)}}")
'''
    
    # Write the script to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Original DataFrame:")
    print(df)
    print()
    print(f"Filtered DataFrame (Age < 30 and Salary > 50000):")
    print(filtered_df)
    print()
    print(f"Script saved to: {random_filename}")
    
    return random_filename

if __name__ == "__main__":
    filename = create_filtered_dataframe_script()