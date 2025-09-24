import requests

def main():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)

    if response.status_code == 200:
        print("API call successful!")
        print("Response:")
        print(response.text)
        # Optionally, save the response to a file
        # with open("api_response.json", "w") as f:
        #     f.write(response.text)
    else:
        print(f"API call failed with status code: {response.status_code}")

if __name__ == "__main__":
    main()
