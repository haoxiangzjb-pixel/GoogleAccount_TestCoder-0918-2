import pymongo

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
