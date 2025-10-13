import requests
import random
import string

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
OUTPUT_DIR = "/workspace"

def generate_random_filename(length=8, prefix="api_script_", suffix=".py"):
    """Generates a random filename."""
    random_chars = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f"{prefix}{random_chars}{suffix}"

def fetch_and_save_api_data(url, output_directory):
    """Fetches data from the API and saves a script to retrieve it."""
    try:
        print(f"Fetching data from: {url}")
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Generate a unique filename
        filename = generate_random_filename()
        filepath = f"{output_directory}/{filename}"

        # Create the Python script content
        script_content = f'''# Auto-generated script to fetch data from {url}
import requests

def fetch_data():
    response = requests.get("{url}")
    response.raise_for_status()
    return response.json()

if __name__ == "__main__":
    data = fetch_data()
    print("Fetched Data:")
    print(data)

'''
        # Write the script to the file
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(script_content)

        print(f"API data fetched successfully. Script saved to: {filepath}")
        return filepath

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching the API: {e}")
        return None
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")
        return None

if __name__ == "__main__":
    saved_script_path = fetch_and_save_api_data(API_URL, OUTPUT_DIR)
    if saved_script_path:
        print(f"The script containing the API call has been saved as: {saved_script_path}")
