import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or one configured via environment variables)
# Replace the URI if your MongoDB instance is remote or has authentication
client = MongoClient('mongodb://localhost:27017/')

# Access a database (it will be created if it doesn't exist)
db = client['my_test_database']

# Access a collection (it will be created if it doesn't exist)
collection = db['my_test_collection']

# Create a sample document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
}

# Insert the document into the collection
result = collection.insert_one(document_to_insert)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
