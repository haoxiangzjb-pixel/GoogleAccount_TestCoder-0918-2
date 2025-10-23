import random
import string

# Define a user structure (class in Python)
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Create a user instance
user = User("Alice", 30)

# Generate a random filename
random_filename = "user_" + ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".txt"

# Write user data to the random-named file
with open(random_filename, 'w') as file:
    file.write(f"Name: {user.name}\n")
    file.write(f"Age: {user.age}\n")

print(f"User data saved to file: {random_filename}")