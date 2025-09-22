import random
import string
import os
import shutil

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Get the current directory
    current_dir = os.getcwd()
    
    # Define source and destination paths
    source_file = "/workspace/selenium_google_test.py"
    destination_file = os.path.join(current_dir, random_filename)
    
    # Copy the file with the new random name
    shutil.copy(source_file, destination_file)
    
    print(f"Selenium test saved to: {destination_file}")
    print(f"Random filename generated: {random_filename}")

if __name__ == "__main__":
    main()