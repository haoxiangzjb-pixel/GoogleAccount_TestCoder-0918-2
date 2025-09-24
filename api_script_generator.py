import uuid
import requests

# Configuration for the API call
API_URL = "https://jsonplaceholder.typicode.com/posts/1"
OUTPUT_DIR = "/workspace"

def fetch_and_save_data():
    """Fetches data from the API and saves it to a randomly named Python file."""
    try:
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise an exception for bad status codes
        data = response.json()

        # Generate a random filename
        random_filename = f"{OUTPUT_DIR}/random_script_{uuid.uuid4().hex}.py"

        # Create the Python script content
        script_content = f'''# Auto-generated script to store API response
# API Endpoint: {API_URL}

api_response = {repr(data)}

if __name__ == "__main__":
    print("Data retrieved from API:")
    print(api_response)
'''

        # Write the script content to the file
        with open(random_filename, 'w', encoding='utf-8') as f:
            f.write(script_content)

        print(f"API response saved to {random_filename}")
        return random_filename

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API request: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    fetch_and_save_data()
