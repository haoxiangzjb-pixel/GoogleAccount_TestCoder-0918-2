import random
import string

def generate_random_filename():
    # Generate a random string of 8 characters
    random_string = ''.join(random.choices(string.ascii_lowercase, k=8))
    return f"{random_string}.fs"

if __name__ == "__main__":
    filename = generate_random_filename()
    print(filename)