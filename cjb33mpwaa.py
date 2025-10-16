import pymongo
from datetime import datetime

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
            "timestamp": datetime.now().isoformat()
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
