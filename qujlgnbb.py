#!/usr/bin/env python3
"""
MongoDB Document Insertion Script
This script demonstrates how to use PyMongo to insert a document into MongoDB.
Note: This script requires a running MongoDB instance and the pymongo library.
"""

import random
import string
from pymongo import MongoClient


def generate_random_string(length=10):
    """Generate a random string of specified length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def insert_document():
    """Insert a sample document into MongoDB"""
    try:
        # Connect to MongoDB (assuming local instance)
        # In practice, you would need to have MongoDB running
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=2000)
        
        # Force a connection check
        client.admin.command('ping')
        
        # Access database and collection
        db = client['test_database']
        collection = db['test_collection']
        
        # Create a sample document
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_id": generate_random_string(8)
        }
        
        # Insert document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Retrieve and display the inserted document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Retrieved document: {inserted_doc}")
        
        # Close connection
        client.close()
        
    except Exception as e:
        print(f"Error connecting to MongoDB: {e}")
        print("Please ensure MongoDB is installed and running on your system.")
        print("You can install MongoDB by following the instructions at: https://docs.mongodb.com/manual/installation/")


if __name__ == "__main__":
    insert_document()