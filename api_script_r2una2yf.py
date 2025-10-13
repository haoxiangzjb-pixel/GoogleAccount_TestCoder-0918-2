# Auto-generated script to fetch data from https://jsonplaceholder.typicode.com/posts/1
import requests

def fetch_data():
    response = requests.get("https://jsonplaceholder.typicode.com/posts/1")
    response.raise_for_status()
    return response.json()

if __name__ == "__main__":
    data = fetch_data()
    print("Fetched Data:")
    print(data)

