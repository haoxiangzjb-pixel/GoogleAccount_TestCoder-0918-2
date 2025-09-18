import random
import string
from pymongo import MongoClient

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    # Connect to MongoDB (assuming it's running locally on default port)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Access database and collection (they will be created if they don't exist)
    db = client['test_database']
    collection = db['test_collection']
    
    # Create a sample document
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "random_string": generate_random_string()
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Document content: {document}")
    
    # Close the connection
    client.close()

if __name__ == "__main__":
    insert_document()