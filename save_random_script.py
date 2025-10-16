import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Content of the API script
    api_script_content = '''import requests
import json
import random
import string

def call_rest_api():
    """
    Calls a REST API and displays the response
    """
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
        else:
            print(f"API call failed with status code: {response.status_code}")
    
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    call_rest_api()
'''

    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(api_script_content)
    
    print(f"API script saved to randomly named file: {random_filename}")

if __name__ == "__main__":
    main()