import random
import string
from pymongo import MongoClient

# Define a function to generate a random filename
def generate_random_filename():
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"/workspace/{random_string}.py"

# The content of the script
script_content = '''from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard cluster)
client = MongoClient('mongodb://localhost:27017/')  # Adjust connection string as needed

# Access a database (it will be created if it doesn't exist)
db = client['my_database']

# Access a collection (it will be created if it doesn't exist)
collection = db['my_collection']

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection (optional, as it's often handled by the application lifecycle)
client.close()
'''

# Generate a random filename
random_filename = generate_random_filename()

# Write the script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Python script created: {random_filename}")
