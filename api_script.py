import requests
import json

# Example: Fetching a random user from the JSONPlaceholder API
url = "https://jsonplaceholder.typicode.com/users/1"

try:
    response = requests.get(url)
    response.raise_for_status()  # Raises an HTTPError for bad responses

    data = response.json()

    # Save the API response to a file
    with open('api_response.json', 'w') as f:
        json.dump(data, f, indent=4)

    print("API call successful. Data saved to api_response.json")
    print(json.dumps(data, indent=2))

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
