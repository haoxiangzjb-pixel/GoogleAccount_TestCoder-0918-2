import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank'],
    'Age': [25, 30, 35, 28, 22, 33],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 65000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print("\n")

# Filter the DataFrame - for example, people older than 27
filtered_df = df[df['Age'] > 27]

print("Filtered DataFrame (Age > 27):")
print(filtered_df)
print("\n")

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = " + filtered_df.to_string().replace('\n', '\n') + "\n")
    f.write("\n# You can convert this back to a DataFrame using pd.read_csv() if needed\n")

print(f"Filtered DataFrame saved to {random_filename}")