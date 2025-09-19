import random
import string

# Generate a random 10-character lowercase string
random_name = ''.join(random.choices(string.ascii_lowercase, k=10))
print(f"{random_name}.py")