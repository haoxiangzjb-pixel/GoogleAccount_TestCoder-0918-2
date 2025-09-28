import pymongo
import random
import string

# Generate a random filename for the script itself
random_script_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Example script content to insert a document
script_content = '''
import pymongo

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["mydatabase"]
collection = db["mycollection"]

# Document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Insert the document
result = collection.insert_one(document_to_insert)

print(f"Document inserted with ID: {{result.inserted_id}}")
'''

# Write the script content to the randomly named file
with open(random_script_name, 'w') as f:
    f.write(script_content)

print(f"MongoDB insert script created and saved as: {random_script_name}")
