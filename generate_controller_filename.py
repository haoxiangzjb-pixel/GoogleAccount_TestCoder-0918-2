import random
import string

def generate_random_filename():
    # Generate a random name for the controller file
    random_name = ''.join(random.choices(string.ascii_uppercase, k=8))
    return f"{random_name}Controller.cs"

if __name__ == "__main__":
    filename = generate_random_filename()
    print(filename)