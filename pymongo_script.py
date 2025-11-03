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
        # Connect to MongoDB (assuming default localhost connection)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or access database
        db = client["sample_db"]
        
        # Create or access collection
        collection = db["sample_collection"]
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "city": "New York",
            "timestamp": pymongo.MongoClient().server_info()['localTime'] if client else None
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
    
    # Insert a document
    doc_id = insert_document()
    
    if doc_id:
        print(f"Successfully inserted document with ID: {doc_id}")
        print(f"Random filename generated: {random_filename}")
        
        # Create the random file with some content
        with open(random_filename, 'w') as f:
            f.write(f"# This is a randomly generated Python file\n")
            f.write(f"# Generated on document insertion with ID: {doc_id}\n")
            f.write(f"DOCUMENT_ID = '{doc_id}'\n")
            f.write("print('This file was generated after MongoDB insertion')\n")
        
        print(f"Random Python file created: {random_filename}")
    else:
        print("Failed to insert document, so no random file was created.")