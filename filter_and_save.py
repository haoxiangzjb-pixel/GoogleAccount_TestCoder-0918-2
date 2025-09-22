import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 32],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000]
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: people older than 30)
filtered_df = df[df['Age'] > 30]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame (Age > 30)\n")
    f.write("import pandas as pd\n\n")
    f.write("data = ")
    f.write(filtered_df.to_dict().__str__())
    f.write("\n\nfiltered_df = pd.DataFrame(data)\n")
    f.write("print(filtered_df)\n")

print(f"Filtered DataFrame saved to {random_filename}")