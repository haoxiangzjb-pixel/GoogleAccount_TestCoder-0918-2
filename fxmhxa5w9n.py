import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["sample_db"]
        
        # Create or connect to a collection
        collection = db["sample_collection"]
        
        # Sample document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "city": "New York",
            "timestamp": "Document inserted"
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return sample_document
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    insert_document()
