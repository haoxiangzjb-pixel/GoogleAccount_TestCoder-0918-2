import random
import string

def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.py"

# Generate a random filename
filename = generate_random_filename()
print(filename)