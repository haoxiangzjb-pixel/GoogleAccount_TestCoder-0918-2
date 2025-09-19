
import requests
import json

def fetch_data_from_api(url):
    """Fetch data from a REST API endpoint"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

def main():
    # Example API endpoint (free JSON placeholder API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Fetch data from the API
    data = fetch_data_from_api(api_url)
    
    if data:
        print("Data fetched successfully:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data from the API")

if __name__ == "__main__":
    main()
