import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 22, 28],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named Python file
# The file will contain the DataFrame as a string
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("filtered_data = ")
    f.write(filtered_df.to_string())

print(f"Original DataFrame:\n{df}")
print(f"\nFiltered DataFrame (Age > 25):\n{filtered_df}")
print(f"\nFiltered data saved to {random_filename}")
