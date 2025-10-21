import requests
import json
import random
import string

def call_rest_api(url):
    """
    Function to call a REST API and return the response
    """
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Return the JSON response
        return response.json()
    
    except requests.exceptions.RequestException as e:
        print(f"Error occurred while calling the API: {e}")
        return None

def save_data_to_file(data, filename):
    """
    Function to save data to a file
    """
    try:
        with open(filename, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"Data successfully saved to {filename}")
    except Exception as e:
        print(f"Error occurred while saving file: {e}")

def generate_random_filename(extension=".py"):
    """
    Function to generate a random filename
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

if __name__ == "__main__":
    # Example API endpoint (using JSONPlaceholder API for demonstration)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Call the API
    api_data = call_rest_api(api_url)
    
    if api_data:
        # Generate a random filename
        random_filename = generate_random_filename(".py")
        
        # Save the API response to the randomly named file
        save_data_to_file(api_data, random_filename)
        
        print(f"Script saved as: {random_filename}")
    else:
        print("Failed to retrieve data from the API")