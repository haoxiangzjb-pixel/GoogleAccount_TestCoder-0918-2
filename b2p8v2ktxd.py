import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a sample REST API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            
            # Save response to a file
            filename = "api_response_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".json"
            with open(filename, 'w') as f:
                json.dump(response.json(), f, indent=2)
            print(f"Response saved to {filename}")
            
        else:
            print(f"API call failed with status code: {response.status_code}")
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")

if __name__ == "__main__":
    call_rest_api()
