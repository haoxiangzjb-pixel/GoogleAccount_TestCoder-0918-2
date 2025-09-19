# Filtered DataFrame
# Original data: {'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'], 'age': [25, 32, 18, 47, 22], 'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']}
filtered_data = {'name': {0: 'Alice', 1: 'Bob', 3: 'David', 4: 'Eve'}, 'age': {0: 25, 1: 32, 3: 47, 4: 22}, 'city': {0: 'New York', 1: 'London', 3: 'Tokyo', 4: 'Berlin'}}
print("Filtered DataFrame:")
print(filtered_data)
