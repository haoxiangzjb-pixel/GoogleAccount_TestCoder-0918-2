import pymongo
import random
import string

# Generate a random database and collection name to avoid conflicts
def random_string(length=8):
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create a random database and collection name
db_name = f"test_db_{random_string()}"
collection_name = f"test_collection_{random_string()}"

# Access the database and collection
db = client[db_name]
collection = db[collection_name]

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random_string(10)
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Database: {db_name}, Collection: {collection_name}")

# Close the connection
client.close()
