import os
import random
import string
import requests

def generate_random_filename(ext='.py'):
    """Generates a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return f"{random_string}{ext}"

def create_api_script(filename, api_url):
    """Creates a Python script that calls an API and prints the response."""
    script_content = f'''import requests

# API endpoint
url = "{api_url}"

try:
    # Make the GET request
    response = requests.get(url)
    
    # Raise an exception if the request was unsuccessful
    response.raise_for_status()
    
    # Print the response JSON
    print("API Response:")
    print(response.json())

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {{e}}")
'''
    with open(filename, 'w') as f:
        f.write(script_content)
    print(f"Script created: {{filename}}")

if __name__ == "__main__":
    # Example API URL (JSONPlaceholder)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the script
    create_api_script(random_filename, api_url)