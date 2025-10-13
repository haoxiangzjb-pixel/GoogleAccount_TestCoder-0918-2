import pymongo
import random
import string

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Access a database (creates it if it doesn't exist)
db = client["my_test_db"]

# Access a collection (creates it if it doesn't exist)
collection = db["test_collection"]

# Generate a random string for the document ID
random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Define the document to insert
document = {
    "random_id": random_id,
    "name": "Test Document",
    "value": 42,
    "description": "This is a sample document inserted by the script."
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Random ID within document: {random_id}")

# Close the connection (optional, as it's handled by garbage collection)
client.close()
