import requests
import json

def call_rest_api(url):
    """
    Call a REST API and return the response
    """
    try:
        # Make GET request to the API
        response = requests.get(url)
        
        # Check if request was successful
        if response.status_code == 200:
            # Parse JSON response
            data = response.json()
            return data
        else:
            print(f"Error: Received status code {response.status_code}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"Error making request: {e}")
        return None

def save_to_file(data, filename):
    """
    Save data to a JSON file
    """
    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)
    print(f"Data saved to {filename}")

# Example usage
if __name__ == "__main__":
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Call the API
    result = call_rest_api(api_url)
    
    if result:
        # Print the result
        print("API Response:")
        print(json.dumps(result, indent=2))
        
        # Save to file
        save_to_file(result, "api_response.json")
