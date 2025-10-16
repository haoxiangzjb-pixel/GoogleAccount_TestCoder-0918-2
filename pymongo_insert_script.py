import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document_to_mongodb():
    """
    Connect to MongoDB, insert a sample document, and save this script to a randomly named .py file
    """
    try:
        # Connect to MongoDB (assuming local MongoDB instance)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["sample_db"]
        
        # Create or connect to a collection
        collection = db["sample_collection"]
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "date_created": pymongo.MongoClient().server_info()['localTime'] if client else None
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Create the content for the randomly named file
        script_content = '''import pymongo

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
            "timestamp": pymongo.MongoClient().server_info()['localTime'] if client else None
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
        
        # Close the MongoDB connection
        client.close()
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document_to_mongodb()