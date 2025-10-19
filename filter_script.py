import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 40, 33, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
}

df = pd.DataFrame(data)

# Filter the DataFrame (for example, people with age less than 30)
filtered_df = df[df['Age'] < 30]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = " + filtered_df.to_string() + "\n")

print(f"Filtered DataFrame saved to {random_filename}")
print("Filtered data:")
print(filtered_df)