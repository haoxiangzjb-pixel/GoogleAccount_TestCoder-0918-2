import random
import string

def factorial(n):
    """Calculate the factorial of a number n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase, k=10))
    return random_name + '.py'

# Generate random filename
filename = generate_random_filename()
print(f"Saving to file: {filename}")

# Save the factorial function to the randomly named file
with open(filename, 'w') as f:
    f.write('''
def factorial(n):
    """Calculate the factorial of a number n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

if __name__ == "__main__":
    # Example usage
    number = 5
    print(f"The factorial of {number} is {factorial(number)}")
''')

print(f"File {filename} has been created successfully!")