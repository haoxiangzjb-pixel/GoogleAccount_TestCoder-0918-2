# Filtered DataFrame (Age > 30)
import pandas as pd

data = {'Name': {2: 'Charlie', 4: 'Eva'}, 'Age': {2: 35, 4: 32}, 'City': {2: 'Paris', 4: 'Berlin'}, 'Salary': {2: 70000, 4: 65000}}

filtered_df = pd.DataFrame(data)
print(filtered_df)
