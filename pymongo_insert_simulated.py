import pymongo
import random
import string
from datetime import datetime

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def simulate_mongodb_insert():
    """
    Simulate inserting a document to MongoDB and save a script to a randomly named .py file
    """
    try:
        # Simulate connecting to MongoDB
        print("Connecting to MongoDB...")
        
        # Simulate creating or connecting to a database
        print("Connected to database: sample_db")
        
        # Simulate creating or connecting to a collection
        print("Using collection: sample_collection")
        
        # Create a sample document to simulate insertion
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "date_created": datetime.now().isoformat()
        }
        
        # Simulate inserting the document
        simulated_id = ''.join(random.choices(string.ascii_lowercase + string.digits, k=24))  # Simulate MongoDB ObjectId
        print(f"Document inserted with ID: {simulated_id}")
        
        # Create the content for the randomly named file
        script_content = '''import pymongo
from datetime import datetime

def insert_sample_document():
    """Insert a sample document into MongoDB"""
    try:
        # Connect to MongoDB
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        db = client["sample_db"]
        collection = db["sample_collection"]
        
        # Sample document
        doc = {
            "name": "Sample User",
            "email": "sample@example.com",
            "timestamp": datetime.now().isoformat()
        }
        
        # Insert document
        result = collection.insert_one(doc)
        print(f"Sample document inserted with ID: {result.inserted_id}")
        
        # Close connection
        client.close()
    except Exception as e:
        print(f"Error inserting document: {e}")

if __name__ == "__main__":
    insert_sample_document()
'''
        
        # Generate a random filename
        random_filename = generate_random_filename()
        
        # Write the script content to the randomly named file
        with open(random_filename, 'w') as file:
            file.write(script_content)
        
        print(f"Script saved to randomly named file: {random_filename}")
        
        # Verify that the file was created
        import os
        if os.path.exists(random_filename):
            print(f"Successfully created file: {random_filename}")
            print(f"File size: {os.path.getsize(random_filename)} bytes")
        else:
            print("Error: File was not created")
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    simulate_mongodb_insert()