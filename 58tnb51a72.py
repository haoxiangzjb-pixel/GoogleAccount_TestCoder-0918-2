import requests
import random
import string

def call_rest_api():
    """Function to call a REST API and display the response"""
    try:
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(response.json())
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

# Call the API
api_data = call_rest_api()

if api_data:
    print("\nAPI data retrieved successfully!")
