
import pandas as pd

# Filtered DataFrame (Age > 25)
data = {
    'Name': ['Bob', 'David'],
    'Age': [32, 47],
    'City': ['London', 'Tokyo'],
    'Salary': [75000, 90000]
}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame:")
print(filtered_df)
