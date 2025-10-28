#!/usr/bin/env python3
"""
Python script using PyMongo to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_document():
    """Generate a random document to insert"""
    return {
        "name": "Sample Document",
        "value": random.randint(1, 1000),
        "description": "This is a randomly generated document",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
        "timestamp": "2025-10-28"
    }

def main():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    try:
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create/use a database
        db = client['sample_database']
        
        # Create/use a collection
        collection = db['sample_collection']
        
        # Generate and insert a random document
        document = generate_random_document()
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Inserted document: {document}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")
        print("Make sure MongoDB is running on your system")

if __name__ == "__main__":
    main()