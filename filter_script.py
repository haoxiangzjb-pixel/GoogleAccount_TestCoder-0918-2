import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named file as a string representation
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("filtered_data = ")
    f.write(filtered_df.to_string(index=False))

print(f"Filtered DataFrame saved to {random_filename}")
print("\nFiltered Data:")
print(filtered_df.to_string(index=False))
