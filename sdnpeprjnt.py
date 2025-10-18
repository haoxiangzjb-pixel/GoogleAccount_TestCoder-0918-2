#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB
"""

import pymongo
import random
import string
from datetime import datetime


def generate_random_collection_name():
    """Generate a random collection name"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10))


def insert_document():
    """
    Connect to MongoDB and insert a sample document
    """
    try:
        # Connect to MongoDB (assuming default localhost:27017)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create a database
        db = client["sample_db"]
        
        # Generate a random collection name
        collection_name = generate_random_collection_name()
        collection = db[collection_name]
        
        # Create a sample document to insert
        document = {
            "name": "Sample Document",
            "created_at": datetime.now(),
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
            "data": {
                "type": "example",
                "value": random.randint(1, 100)
            }
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Database: sample_db")
        print(f"Collection: {collection_name}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None


if __name__ == "__main__":
    inserted_id = insert_document()
    if inserted_id:
        print("Document insertion completed successfully!")
    else:
        print("Document insertion failed!")