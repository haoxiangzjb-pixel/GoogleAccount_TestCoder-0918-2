import pymongo
import random
import string

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    """Insert a document into MongoDB"""
    try:
        # Connect to MongoDB (assuming it's running locally on default port)
        client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=2000)
        
        # Force a connection check
        client.admin.command('ping')
        
        # Create or access a database
        db = client["test_database"]
        
        # Create or access a collection
        collection = db["test_collection"]
        
        # Create a sample document
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_id": generate_random_string()
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Document content: {document}")
        
        # Close the connection
        client.close()
        
    except pymongo.errors.ServerSelectionTimeoutError:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        print("However, here's the document that would be inserted:")
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_id": generate_random_string()
        }
        print(f"Document content: {document}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()