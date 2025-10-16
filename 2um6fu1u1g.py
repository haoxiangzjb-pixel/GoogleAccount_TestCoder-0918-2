# This file was generated with a random name
import requests
import json

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    url = "https://jsonplaceholder.typicode.com/posts/1"

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()

        print("API Response:")
        print(json.dumps(data, indent=2))

        return data

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()
