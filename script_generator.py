import os
import requests
import uuid

def generate_api_script(api_url, output_dir="/tmp"):
    """Generates a Python script that calls a REST API and saves the response."""
    script_content = f'''import requests

def call_api_and_save():
    """Calls the API and saves the response."""
    url = "{api_url}"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Save the response text to a file
        with open("api_response.json", "w", encoding="utf-8") as f:
            f.write(response.text)

        print(f"API response saved to api_response.json")
        print(f"Status Code: {{response.status_code}}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {{e}}")

if __name__ == "__main__":
    call_api_and_save()
'''

    # Generate a random filename with .py extension
    random_filename = f"{str(uuid.uuid4())[:8]}.py"
    full_path = os.path.join(output_dir, random_filename)

    # Write the script content to the randomly named file
    with open(full_path, 'w', encoding='utf-8') as f:
        f.write(script_content)

    print(f"Generated Python script: {full_path}")
    return full_path

if __name__ == "__main__":
    api_endpoint = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
    generate_api_script(api_endpoint)
