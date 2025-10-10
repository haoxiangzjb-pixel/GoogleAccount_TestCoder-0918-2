import requests

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
