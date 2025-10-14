import requests

# API endpoint
url = "https://jsonplaceholder.typicode.com/posts/1"

try:
    # Make the GET request
    response = requests.get(url)
    
    # Raise an exception if the request was unsuccessful
    response.raise_for_status()
    
    # Print the response JSON
    print("API Response:")
    print(response.json())

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
