import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 22, 28],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: filter for Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
# Note: Saving data to a .py file is unusual; typically .csv or .pkl is used.
# This script saves the Python code to recreate the DataFrame to the .py file.
with open(random_filename, 'w') as f:
    f.write("# This script was generated with a filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")
    f.write("df = pd.DataFrame(filtered_data)\n")

print(f"Filtered DataFrame saved to {random_filename}")
print(df)