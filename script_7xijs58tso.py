import pandas as pd

# Load your data from a source (e.g., CSV, database)
# df = pd.read_csv('your_data_source.csv')

# Example DataFrame creation for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Apply your filter condition here
filtered_df = df[df['Age'] > 30]  # Example condition

# Save the filtered DataFrame to a file
# Generate a random filename for the output
import random
import string
random_filename = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(8)) + '.csv'
filtered_df.to_csv(random_filename, index=False)

print(f"Filtered data saved to: {{random_filename}}')
