from pymongo import MongoClient

# Connect to MongoDB (adjust connection string as needed)
client = MongoClient("mongodb://localhost:27017/")

# Select database and collection
db = client["my_database"]
collection = db["my_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Insert the document
result = collection.insert_one(document)

print(f"Inserted document with ID: {result.inserted_id}")

# Close the connection
client.close()
