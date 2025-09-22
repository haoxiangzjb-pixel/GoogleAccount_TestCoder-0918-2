import random
import string
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return random_name + ".py"

def insert_document():
    """Simulate inserting a document into MongoDB"""
    # In a real application, you would connect to MongoDB and insert a document
    # For this example, we'll just simulate the process
    
    # Simulated document to insert
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "interests": ["Python", "MongoDB", "AI"]
    }
    
    # Simulate insertion result
    inserted_id = "507f1f77bcf86cd799439011"  # Example ObjectId
    
    print(f"Document inserted with ID: {inserted_id}")
    print(f"Inserted document: {document}")

if __name__ == "__main__":
    insert_document()
    filename = generate_random_filename()
    print(f"Script would be saved as: {filename}")