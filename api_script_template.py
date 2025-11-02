import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def call_rest_api():
    """Call a REST API and save the response"""
    try:
        # Using JSONPlaceholder API as an example
        url = "https://jsonplaceholder.typicode.com/posts/1"
        
        # Make the API request
        response = requests.get(url)
        
        # Check if request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:", response.json())
            
            # Generate a random filename
            random_filename = generate_random_filename()
            
            # Save the response data to the randomly named file
            with open(random_filename, 'w') as f:
                f.write("# API Response Data\n")
                f.write("api_response = ")
                f.write(json.dumps(response.json(), indent=2))
                f.write("\n")
            
            print(f"Data saved to {random_filename}")
            return random_filename
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API request: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()