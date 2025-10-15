import pymongo
import random
import string

# Create a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Connect to MongoDB (assuming local MongoDB instance)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    # Create a database
    db = client["sample_db"]
    # Create a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": "John Doe",
        "age": 30,
        "email": "john.doe@example.com",
        "city": "New York",
        "insertion_timestamp": pymongo.MongoClient().server_info()['localTime'] if client else None
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the insertion by finding the document
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Inserted document: {inserted_doc}")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write('''import pymongo
import random
import string

# Connect to MongoDB (assuming local MongoDB instance)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    # Create a database
    db = client["sample_db"]
    # Create a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": "John Doe",
        "age": 30,
        "email": "john.doe@example.com",
        "city": "New York"
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the insertion by finding the document
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Inserted document: {inserted_doc}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please make sure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")

print(f"This script has been saved to: {__file__}")
''')
    
    print(f"Script saved to randomly named file: {random_filename}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please make sure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")

print(f"This script has been saved to: {__file__}")