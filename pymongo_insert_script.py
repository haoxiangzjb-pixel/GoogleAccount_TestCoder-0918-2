#!/usr/bin/env python3
"""
PyMongo script to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
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
            'timestamp': '2023-01-01T00:00:00Z',
            'status': 'active'
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document successfully inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
    except Exception as e:
        print(f"Could not connect to MongoDB: {e}")
        print("Make sure MongoDB is running on localhost:27017")
        return None

def save_script_to_random_file():
    """Save this script to a randomly named .py file"""
    random_filename = generate_random_filename()
    
    script_content = '''#!/usr/bin/env python3
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
        \'name\': \'John Doe\',
        \'email\': \'john.doe@example.com\',
        \'age\': 30,
        \'city\': \'New York\',
        \'timestamp\': \'2023-01-01T00:00:00Z\'
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
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Insert a document first
    inserted_id = insert_document()
    print(f"Successfully inserted document with ID: {inserted_id}")
    
    # Then save this script to a randomly named file
    random_file = save_script_to_random_file()
    print(f"Also saved this script to a new random file: {random_file}")