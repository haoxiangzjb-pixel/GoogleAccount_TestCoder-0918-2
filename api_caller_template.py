import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"api_script_{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_file(filename):
    """Save a sample API calling script to a file"""
    script_content = '''import requests
import json

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

# Example usage
if __name__ == "__main__":
    # Calling a sample REST API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    result = call_rest_api(api_url)
    
    if result:
        print("API Response:")
        print(json.dumps(result, indent=2))
    else:
        print("Failed to get response from API")
'''

    with open(filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {filename}")

def main():
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the script to the randomly named file
    save_script_to_file(filename)
    
    # Example of using the function
    print(f"Created script: {filename}")

if __name__ == "__main__":
    main()