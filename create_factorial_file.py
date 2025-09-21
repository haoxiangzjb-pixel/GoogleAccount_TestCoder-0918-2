import random
import string
import os

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
    filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
    return filename

def save_factorial_function(filename):
    """Save the factorial function to a Python file."""
    function_code = '''def factorial(n):
    """Calculate the factorial of a number n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Example usage
if __name__ == "__main__":
    number = 5
    print(f"Factorial of {number} is {factorial(number)}")
'''
    
    with open(filename, 'w') as f:
        f.write(function_code)
    print(f"Factorial function saved to {filename}")

if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    print(f"Random filename: {filename}")
    
    # Save the factorial function to the file
    save_factorial_function(filename)
    
    # Example usage of factorial function
    number = 5
    print(f"Factorial of {number} is {factorial(number)}")