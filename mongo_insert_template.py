import random
import string
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return random_name + ".py"

def insert_document():
    """Insert a document into MongoDB"""
    # Connect to MongoDB (assuming local instance)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Access database and collection
    db = client['test_database']
    collection = db['test_collection']
    
    # Document to insert
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "interests": ["Python", "MongoDB", "AI"]
    }
    
    # Insert document
    result = collection.insert_one(document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify insertion
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
    # Close connection
    client.close()

if __name__ == "__main__":
    insert_document()
    filename = generate_random_filename()
    print(f"Script would be saved as: {filename}")