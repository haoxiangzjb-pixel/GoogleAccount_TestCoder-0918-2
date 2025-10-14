import pandas as pd

# Sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame: Select people older than 26
filtered_df = df[df['Age'] > 26]

print("Filtered DataFrame:")
print(filtered_df)

# Save the filtered DataFrame to a new CSV file
filtered_df.to_csv('filtered_output.csv', index=False)
print("\nFiltered DataFrame saved to 'filtered_output.csv'.")
