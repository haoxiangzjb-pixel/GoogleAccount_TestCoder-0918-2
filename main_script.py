import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 32, 18, 47, 22, 38, 29, 51],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'New York', 'London', 'Sydney', 'Berlin'],
    'Salary': [50000, 65000, 32000, 80000, 45000, 70000, 55000, 85000]
}

df = pd.DataFrame(data)

# Filter the DataFrame: people older than 25 and salary greater than 50000
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 50000)]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 25 and Salary > 50000):")
print(filtered_df)

# Generate a random filename with .py extension
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data from filtered DataFrame\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n\n")
    f.write("# Convert to DataFrame\n")
    f.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(df_filtered)\n")

print(f"\nFiltered DataFrame has been saved to {random_filename}")
print(f"File exists: {os.path.exists(random_filename)}")