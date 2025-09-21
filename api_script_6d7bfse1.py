
import requests
import json

def fetch_data_from_api(url):
    """
    Fetch data from a REST API endpoint
    """
    try:
        # Make GET request to the API
        response = requests.get(url)
        # Raise an exception for bad status codes
        response.raise_for_status()
        # Parse JSON response
        data = response.json()
        return data
    except requests.exceptions.RequestException as e:
        print(f"Error occurred: {e}")
        return None

def main():
    # Example API endpoint (free REST API for testing)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Call the API
    result = fetch_data_from_api(api_url)
    
    if result:
        print("API Response:")
        print(json.dumps(result, indent=2))
    else:
        print("Failed to fetch data from API")

if __name__ == "__main__":
    main()
