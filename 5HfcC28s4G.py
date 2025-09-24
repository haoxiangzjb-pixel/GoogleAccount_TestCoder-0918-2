import pymongo

# Connect to MongoDB (assuming default local installation)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Access a database (creates it if it doesn't exist)
db = client["my_test_database"]

# Access a collection (creates it if it doesn't exist)
collection = db["my_test_collection"]

# Define the document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 35,
    "city": "New York",
    "hobbies": ["reading", "hiking"]
}

# Insert the document into the collection
result = collection.insert_one(document_to_insert)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection (optional, as it's often handled by the application lifecycle)
client.close()
