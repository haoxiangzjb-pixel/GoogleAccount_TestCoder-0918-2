import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
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

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
