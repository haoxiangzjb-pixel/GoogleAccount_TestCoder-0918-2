
import pymongo

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["mydatabase"]
collection = db["mycollection"]

# Document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Insert the document
result = collection.insert_one(document_to_insert)

print(f"Document inserted with ID: {{result.inserted_id}}")
