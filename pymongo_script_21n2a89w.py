import pymongo
from pymongo import MongoClient

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = MongoClient('mongodb://localhost:27017/')

# Create or connect to a database
db = client['sample_database']

# Create or connect to a collection
collection = db['sample_collection']

# Create a document to insert
document = {
    'name': 'John Doe',
    'age': 35,
    'email': 'john.doe@example.com',
    'city': 'New York',
    'hobbies': ['reading', 'swimming', 'coding']
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f'Document inserted with ID: {result.inserted_id}')

# Verify the document was inserted by finding it
found_document = collection.find_one({'_id': result.inserted_id})
print(f'Verified document: {found_document}')

# Close the connection
client.close()
