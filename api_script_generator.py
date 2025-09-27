import requests
import random
import string

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}.py"

def fetch_and_save_api_data(url, output_filename):
    """Fetches data from a REST API and saves it to a file."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(f"# Data fetched from {url}\n")
            f.write(response.text)

        print(f"Data successfully fetched and saved to {output_filename}")
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    # Example API endpoint
    api_url = "https://jsonplaceholder.typicode.com/posts/1"

    # Generate a random filename
    filename = generate_random_filename()

    # Fetch data and save it
    fetch_and_save_api_data(api_url, filename)
