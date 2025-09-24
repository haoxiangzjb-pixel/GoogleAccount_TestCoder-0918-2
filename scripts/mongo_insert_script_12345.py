import random
from pymongo import MongoClient

# Generate a random number to append to the script name for uniqueness
random_id = random.randint(10000, 99999)

# Connect to MongoDB (assumes a local instance by default)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_collection']

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random_id
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Random ID for this script run: {random_id}")

# Close the connection
client.close()
