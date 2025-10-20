import pymongo

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
