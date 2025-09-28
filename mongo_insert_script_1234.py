import pymongo
from dotenv import load_dotenv
import os
import random
import string

# Load environment variables (if any)
load_dotenv()

# Connect to MongoDB (replace with your connection string)
# Using a placeholder string here as a default, will connect to local instance on default port
connection_string = os.getenv("MONGODB_URI", "mongodb://localhost:27017/")
client = pymongo.MongoClient(connection_string)

# Specify the database and collection
db_name = os.getenv("DB_NAME", "my_test_db")
collection_name = os.getenv("COLLECTION_NAME", "my_test_collection")

db = client[db_name]
collection = db[collection_name]

# Create a sample document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
}

# Insert the document
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()