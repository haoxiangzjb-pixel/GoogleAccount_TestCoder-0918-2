import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace with your MongoDB connection string.
# For a local instance, it's usually 'mongodb://localhost:27017/'
MONGO_URI = "mongodb://localhost:27017/"
DATABASE_NAME = "my_test_db"
COLLECTION_NAME = "my_test_collection"

# --- Main Script ---
def main():
    # Connect to MongoDB
    client = MongoClient(MONGO_URI)
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]

    # Create a sample document to insert
    sample_document = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    }

    # Insert the document into the collection
    result = collection.insert_one(sample_document)

    print(f"Document inserted with ID: {result.inserted_id}")

    # Close the connection
    client.close()

if __name__ == "__main__":
    main()
