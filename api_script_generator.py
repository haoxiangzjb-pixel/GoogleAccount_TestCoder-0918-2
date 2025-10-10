import uuid
import requests

# Generate a random filename
random_filename = f"api_call_script_{uuid.uuid4().hex[:8]}.py"

# Content for the new script
script_content = '''import requests

def call_api_and_save():
    # Example API call, replace with your specific API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        print("API call successful!")
        print(f"Data: {data}")
        # You can save the data to a file here if needed
    else:
        print(f"API call failed with status code: {response.status_code}")

if __name__ == "__main__":
    call_api_and_save()
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Python script created: {random_filename}")
