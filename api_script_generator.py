import os
import random
import string
import requests

def generate_random_filename(ext='.py'):
    """Generates a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{ext}"

def create_api_script(filename, api_url):
    """Creates a Python script that calls a REST API and saves the response."""
    script_content = f'''import requests

def main():
    url = "{api_url}"
    response = requests.get(url)

    if response.status_code == 200:
        print("API call successful!")
        print("Response:")
        print(response.text)
        # Optionally, save the response to a file
        # with open("api_response.json", "w") as f:
        #     f.write(response.text)
    else:
        print(f"API call failed with status code: {{response.status_code}}")

if __name__ == "__main__":
    main()
'''

    with open(filename, 'w') as f:
        f.write(script_content)
    print(f"Python script created: {{filename}}")

if __name__ == "__main__":
    # Example API URL, replace with your desired API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    random_filename = generate_random_filename()
    create_api_script(random_filename, api_url)
