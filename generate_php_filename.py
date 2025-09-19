#!/usr/bin/env python3
import random
import string

def generate_random_filename(extension):
    """Generate a random filename with the specified extension."""
    # Generate a random string of 10 lowercase letters
    random_string = ''.join(random.choices(string.ascii_lowercase, k=10))
    return f"{random_string}.{extension}"

if __name__ == "__main__":
    filename = generate_random_filename("php")
    print(filename)