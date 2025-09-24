import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace with your MongoDB connection string.
# For a local instance, the default is usually 'mongodb://localhost:27017/'
MONGO_URI = "mongodb://localhost:27017/"
DATABASE_NAME = "test_database"
COLLECTION_NAME = "test_collection"

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(length))
    return f"{random_string}.py"

def save_script_with_random_name():
    """Saves this script with a random filename."""
    try:
        # Generate a random filename for this script
        random_filename = generate_random_filename()

        # Save this script to the new file
        with open(__file__, 'r') as source_file:
            script_content = source_file.read()

        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)

        print(f"Script saved as: {random_filename}")

    except Exception as e:
        print(f"An error occurred while saving the script: {e}")

if __name__ == "__main__":
    save_script_with_random_name()
