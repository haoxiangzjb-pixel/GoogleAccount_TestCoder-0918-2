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
        client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=2000)  # 2 second timeout
        
        # Test the connection
        client.admin.command('ping')
        
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
        # Create the random file even if MongoDB connection fails
        random_file = save_script_to_random_file()
        print(f"Randomly named file created: {random_file}")
        return {"error": "connection_failed", "random_file": random_file}
    except Exception as e:
        print(f"An error occurred: {e}")
        # Create the random file even if there's an error
        random_file = save_script_to_random_file()
        print(f"Randomly named file created despite error: {random_file}")
        return {"error": str(e), "random_file": random_file}

def save_script_to_random_file():
    """Save this script to a randomly named .py file"""
    # Get the current script content
    script_content = '''import pymongo
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
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Insert a document
    doc = insert_document()
    
    # Save this script to a randomly named file
    if doc:  # Only save if the document was inserted successfully
        random_file = save_script_to_random_file()
        print(f"Randomly named file created: {random_file}")