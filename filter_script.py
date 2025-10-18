import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 40, 33, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
}

df = pd.DataFrame(data)

# Filter the DataFrame - for example, people with age less than 30
filtered_df = df[df['Age'] < 30]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age < 30):")
print(filtered_df)

# Function to generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Save the filtered DataFrame to a randomly named .py file
random_filename = generate_random_filename()

# Write the filtered DataFrame to the randomly named file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = ")
    f.write(repr(filtered_df.to_dict('records')))
    f.write("\n\n# Convert back to DataFrame\n")
    f.write("filtered_df = pd.DataFrame(filtered_data)\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(filtered_df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")