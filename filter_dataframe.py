import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'],
    'Age': [25, 30, 35, 28, 32, 27],
    'City': ['New York', 'Los Angeles', 'Chicago', 'New York', 'Chicago', 'Boston'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 52000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print()

# Filter the DataFrame - let's filter for people older than 28
filtered_df = df[df['Age'] > 28]

print("Filtered DataFrame (Age > 28):")
print(filtered_df)
print()

# Generate a random filename with .py extension
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data as a dictionary\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
    f.write("# Convert to DataFrame\n")
    f.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(df_filtered)\n")

print(f"Filtered DataFrame has been saved to {random_filename}")
print(f"File exists: {os.path.exists(random_filename)}")

# Show the content of the generated file
print(f"\nContent of {random_filename}:")
with open(random_filename, 'r') as f:
    print(f.read())