from pymongo import MongoClient

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
