import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: filter for Age > 30)
filtered_df = df[df['Age'] > 30]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.csv'

# Save the filtered DataFrame to the random file
filtered_df.to_csv(random_filename, index=False)

print(f"Filtered DataFrame saved to {random_filename}")
print(filtered_df)
