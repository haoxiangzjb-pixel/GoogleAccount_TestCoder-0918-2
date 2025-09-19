import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'age': [25, 32, 18, 47, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., people older than 21)
filtered_df = df[df['age'] > 21]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write('# Filtered DataFrame\n')
    f.write(f'# Original data: {data}\n')
    f.write(f'filtered_data = {filtered_df.to_dict()}\n')
    f.write('print("Filtered DataFrame:")\n')
    f.write('print(filtered_data)\n')

print(f"DataFrame filtered and saved to {random_filename}")