#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB.
This script connects to a MongoDB instance and inserts a sample document.
"""

from pymongo import MongoClient
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """
    Connect to MongoDB and insert a sample document.
    Note: This assumes MongoDB is running locally on default port 27017.
    """
    try:
        # Connect to MongoDB (assumes MongoDB is running locally)
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create or connect to a database
        db = client['sample_database']
        
        # Create or connect to a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-01-01T00:00:00Z",
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify the insertion by finding the document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Inserted document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    print("Connecting to MongoDB and inserting a document...")
    inserted_id = insert_document()
    
    if inserted_id:
        print("Document successfully inserted!")
    else:
        print("Failed to insert document.")
        
    # Generate and display a random filename as requested
    random_filename = generate_random_filename()
    print(f"Random filename generated: {random_filename}")