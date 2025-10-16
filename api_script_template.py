import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a demo API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        return data
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Call the API
    api_data = call_rest_api()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create a new Python file with the random name
    with open(random_filename, 'w') as f:
        f.write('# This file was generated with a random name\n')
        f.write('import requests\n')
        f.write('import json\n\n')
        f.write('def call_rest_api():\n')
        f.write('    """\n')
        f.write('    Function to call a REST API and display the response\n')
        f.write('    """\n')
        f.write('    url = "https://jsonplaceholder.typicode.com/posts/1"\n\n')
        f.write('    try:\n')
        f.write('        response = requests.get(url)\n')
        f.write('        response.raise_for_status()\n')
        f.write('        data = response.json()\n\n')
        f.write('        print("API Response:")\n')
        f.write('        print(json.dumps(data, indent=2))\n\n')
        f.write('        return data\n\n')
        f.write('    except requests.exceptions.RequestException as e:\n')
        f.write('        print(f"An error occurred while calling the API: {e}")\n')
        f.write('        return None\n\n')
        f.write('if __name__ == "__main__":\n')
        f.write('    call_rest_api()\n')
    
    print(f"\nScript saved to: {random_filename}")