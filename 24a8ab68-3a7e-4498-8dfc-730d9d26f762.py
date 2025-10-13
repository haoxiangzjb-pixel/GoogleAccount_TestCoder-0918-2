import requests
import json

def fetch_data_and_save(url, output_file):
  """
  Fetches data from a REST API and saves the response to a file.

  Args:
    url: The URL of the REST API endpoint.
    output_file: The path to the file where the response will be saved.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

    with open(output_file, 'w', encoding='utf-8') as f:
      json.dump(response.json(), f, indent=2)

    print(f"Data successfully fetched from {url} and saved to {output_file}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while making the request: {e}")
  except json.JSONDecodeError:
    print("Error: The response is not valid JSON.")
  except IOError as e:
    print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
  # Example API: JSONPlaceholder (https://jsonplaceholder.typicode.com/)
  API_URL = "https://jsonplaceholder.typicode.com/posts/1"
  OUTPUT_FILE = "api_response.json" # This will be replaced by the caller

  fetch_data_and_save(API_URL, OUTPUT_FILE)