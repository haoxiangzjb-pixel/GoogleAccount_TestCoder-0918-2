#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection
"""

from pymongo import MongoClient
import random
import string
import inspect
import sys

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """
    Connect to MongoDB and insert a sample document
    """
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
        # Create or access a database
        db = client['sample_database']
        
        # Create or access a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "registration_date": "2023-01-01",
            "active": True,
            "timestamp": "2023-01-01T00:00:00Z"
        }
        
        # Insert the document into the collection
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
    except Exception as e:
        print(f"Could not connect to MongoDB: {e}")
        print("Skipping document insertion.")
        return None

def save_script_to_random_file():
    """
    Save this script to a randomly named .py file
    """
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Get the source code of this script
    current_script_source = inspect.getsource(sys.modules[__name__])
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(current_script_source)
    
    print(f"Script saved to {random_filename}")
    
    return random_filename

if __name__ == "__main__":
    # Insert a document
    doc_id = insert_document()
    
    # Save this script to a randomly named file
    random_file = save_script_to_random_file()
    
    print(f"Process completed. Random file created: {random_file}")