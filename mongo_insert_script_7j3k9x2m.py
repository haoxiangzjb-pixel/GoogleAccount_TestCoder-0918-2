import pymongo
import random
import string
import sys

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    """Insert a document into MongoDB"""
    try:
        # Connect to MongoDB (assuming it's running locally on default port)
        print("Attempting to connect to MongoDB at mongodb://localhost:27017/")
        client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=5000)
        
        # Test the connection
        client.admin.command('ping')
        print("Connected to MongoDB successfully")
        
        # Create or connect to database
        db = client["test_database"]
        
        # Create or connect to collection
        collection = db["test_collection"]
        
        # Create a sample document
        document = {
            "_id": generate_random_string(8),
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_field": generate_random_string(15)
        }
        
        print(f"Inserting document: {document}")
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify insertion by finding the document
        found_document = collection.find_one({"_id": document["_id"]})
        print(f"Retrieved document: {found_document}")
        
        # Close the connection
        client.close()
        return True
        
    except pymongo.errors.ServerSelectionTimeoutError as e:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        print("The script will demonstrate what the document would look like:")
        document = {
            "_id": generate_random_string(8),
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_field": generate_random_string(15)
        }
        print(f"Sample document that would be inserted: {document}")
        return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False

if __name__ == "__main__":
    insert_document()