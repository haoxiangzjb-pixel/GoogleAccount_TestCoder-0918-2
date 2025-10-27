import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 32, 27, 31, 29],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 52000, 68000, 58000]
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: people older than 29)
filtered_df = df[df['Age'] > 29]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 29):")
print(filtered_df)

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to a randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    # Save the filtered data as a proper dictionary that can be executed as Python code
    f.write("filtered_dict = " + str(filtered_df.to_dict('records')) + "\n")
    f.write("filtered_df = pd.DataFrame(filtered_dict)\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(filtered_df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")