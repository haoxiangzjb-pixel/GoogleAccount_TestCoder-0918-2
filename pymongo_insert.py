import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assuming default localhost:27017)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create/Access database and collection
        db = client["sample_db"]
        collection = db["sample_collection"]
        
        # Document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "city": "New York",
            "timestamp": pymongo.MongoClient().server_info()['version'] if client else 'unknown'
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
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
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create a simple PyMongo insertion script
    script_content = '''import pymongo

def insert_sample_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assuming default localhost:27017)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create/Access database and collection
        db = client["sample_db"]
        collection = db["sample_collection"]
        
        # Document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "city": "New York",
            "inserted_at": "datetime.datetime.now()"
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_sample_document()
'''
    
    # Write the script to the randomly generated filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"PyMongo script saved to: {random_filename}")
    
    # Also run the insertion for demonstration
    insert_document()