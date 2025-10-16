import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the GET request
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

def save_to_random_file(content):
    """
    Function to save content to a randomly named .py file
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    with open(random_name, 'w') as f:
        f.write(content)
    
    print(f"Content saved to {random_name}")
    return random_name

if __name__ == "__main__":
    # Get API response
    api_data = call_rest_api()
    
    if api_data:
        # Create content to save
        content = f"# API Response Data\napi_response = {repr(api_data)}\n\nprint('API response data loaded successfully!')\nprint(api_response)\n"
        
        # Save to a randomly named file
        random_filename = save_to_random_file(content)
        print(f"Script saved as: {random_filename}")