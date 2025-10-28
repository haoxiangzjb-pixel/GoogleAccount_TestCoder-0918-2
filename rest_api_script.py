import requests
import random
import string
import os

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    try:
        # Using JSONPlaceholder as a demo API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        
        # Make the GET request
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(response.json())
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_script_to_random_file():
    """
    Save this script to a randomly named .py file
    """
    # Get the current script content
    script_content = '''import requests
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    try:
        # Using JSONPlaceholder as a demo API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        
        # Make the GET request
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(response.json())
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    print("Calling REST API...")
    api_data = call_rest_api()
    
    if api_data:
        print("\\nGenerating random filename...")
        random_filename = generate_random_filename()
        print(f"Random filename generated: {random_filename}")
        
        # Save this script to the random filename
        with open(random_filename, "w") as file:
            file.write(__doc__)
        
        print(f"Script saved to {random_filename}")

if __name__ == "__main__":
    main()
'''

    random_filename = generate_random_filename()
    
    with open(random_filename, "w") as file:
        file.write(script_content)
    
    print(f"Script saved to {random_filename}")
    return random_filename

def main():
    print("Calling REST API...")
    api_data = call_rest_api()
    
    if api_data:
        print("\nGenerating random filename...")
        random_filename = generate_random_filename()
        print(f"Random filename generated: {random_filename}")
        
        # Create a simplified version of the script for the random file
        simplified_script = f'''import requests
import random
import string

def call_rest_api():
    """Function to call a REST API and display the response"""
    try:
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(response.json())
            return response.json()
        else:
            print(f"API call failed with status code: {{response.status_code}}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {{e}}")
        return None

# Call the API
api_data = call_rest_api()

if api_data:
    print("\\nAPI data retrieved successfully!")
'''
        
        # Save the simplified script to the random filename
        with open(random_filename, "w") as file:
            file.write(simplified_script)
        
        print(f"Simplified script saved to {random_filename}")

if __name__ == "__main__":
    main()