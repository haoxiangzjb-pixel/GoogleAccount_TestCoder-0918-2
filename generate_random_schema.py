import random
import string
import os

def generate_random_filename():
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.graphql"

# Read the content from the original schema file
with open('/workspace/schema.graphql', 'r') as original_file:
    schema_content = original_file.read()

# Generate a random filename
random_filename = generate_random_filename()
random_file_path = f'/workspace/{random_filename}'

# Write the schema content to the new randomly named file
with open(random_file_path, 'w') as random_file:
    random_file.write(schema_content)

print(f"Schema saved to randomly named file: {random_file_path}")