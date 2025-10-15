import pymongo
import random
import string
import os

# Create a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Generate a random filename
random_filename = generate_random_filename()

# Create a PyMongo script that would insert a document
pymongo_code = '''import pymongo

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
        "description": "Sample document inserted using PyMongo"
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the insertion by finding the document
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Inserted document: {inserted_doc}")
    
    print("Document insertion completed successfully!")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please make sure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")
'''

# Save the PyMongo script to the randomly named file
with open(random_filename, 'w') as f:
    f.write(pymongo_code)

print(f"PyMongo script created successfully!")
print(f"Script content:")
print(pymongo_code)
print(f"Script saved to randomly named file: {random_filename}")

# Verify the file was created
if os.path.exists(random_filename):
    print(f"File {random_filename} exists and contains the PyMongo script.")
else:
    print(f"Error: File {random_filename} was not created.")