import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'product': ['A', 'B', 'C', 'D', 'E'],
    'price': [10.99, 25.50, 5.75, 30.25, 15.00],
    'stock': [100, 25, 0, 75, 200],
    'category': ['electronics', 'books', 'clothing', 'electronics', 'books']
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: products with price > 15)
expensive_items = df[df['price'] > 15]

print("\nFiltered DataFrame (price > 15):")
print(expensive_items)

# Save to CSV
expensive_items.to_csv('expensive_items.csv', index=False)
print("\nFiltered data saved to expensive_items.csv")