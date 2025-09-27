import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 30, 22],
    'City': ['New York', 'London', 'Paris', 'New York', 'Tokyo']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = 'output_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.csv'

# Save the filtered DataFrame
filtered_df.to_csv(random_filename, index=False)

print(f"Filtered DataFrame saved to {random_filename}")
print(filtered_df)
