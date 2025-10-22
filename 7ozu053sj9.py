#!/usr/bin/env python3
"""
PyMongo script to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    # Connect to MongoDB (assumes MongoDB is running locally on default port)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Create/use a database
    db = client['sample_database']
    
    # Create/use a collection
    collection = db['sample_collection']
    
    # Sample document to insert
    document = {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'age': 30,
        'city': 'New York',
        'timestamp': '2023-01-01T00:00:00Z'
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Close the connection
    client.close()
    
    return result.inserted_id

if __name__ == "__main__":
    inserted_id = insert_document()
    print(f"Successfully inserted document with ID: {inserted_id}")
