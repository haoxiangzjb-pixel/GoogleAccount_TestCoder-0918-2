import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [70000, 85000, 50000, 120000, 65000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., people older than 25 with salary > 60000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 60000)]
print("\nFiltered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Save the filtered DataFrame to a new Python file
with open(random_filename, 'w') as f:
    f.write("import pandas as pd\n\n")
    f.write("# Filtered DataFrame\n")
    f.write("data = ")
    f.write(filtered_df.to_dict('records').__repr__())
    f.write("\n\nfiltered_df = pd.DataFrame(data)\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(filtered_df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")