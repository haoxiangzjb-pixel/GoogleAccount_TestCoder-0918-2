import requests
import json

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
OUTPUT_FILE = "api_response.json"

def fetch_and_save():
    try:
        # Make the API call
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Parse the JSON response
        data = response.json()

        # Save the response to a file
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print(f"Data successfully fetched and saved to {OUTPUT_FILE}")
        print(json.dumps(data, indent=2))

    except requests.exceptions.RequestException as e:
        print(f"An error occurred during the API request: {e}")
    except json.JSONDecodeError as e:
        print(f"An error occurred while parsing the JSON response: {e}")
    except IOError as e:
        print(f"An error occurred while writing to the file: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    fetch_and_save()
