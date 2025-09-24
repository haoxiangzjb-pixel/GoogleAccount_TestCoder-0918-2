import pymongo
from pymongo import MongoClient
import random
import string

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_test_collection']

# Generate a random string for the document content
random_content = ''.join(random.choices(string.ascii_letters + string.digits, k=20))

# Define the document to insert
document_to_insert = {
    "name": "Example Document",
    "value": random_content,
    "description": "This is a randomly generated document for testing PyMongo insert operations."
}

# Insert the document into the collection
result = collection.insert_one(document_to_insert)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
