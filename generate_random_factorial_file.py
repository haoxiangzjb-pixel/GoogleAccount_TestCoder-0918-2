import random
import string
import os


def generate_random_filename(extension=".py", length=10):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{random_name}{extension}"


def create_factorial_function_file():
    """Create a Python file with a factorial function using a random filename."""
    # Define the factorial function as a string
    factorial_code = '''def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
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
    print(f"Factorial of 5: {factorial(5)}")
    print(f"Factorial of 0: {factorial(0)}")
    print(f"Factorial of 1: {factorial(1)}")
'''

    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the factorial function to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(factorial_code)
    
    print(f"Factorial function saved to: {random_filename}")
    return random_filename


if __name__ == "__main__":
    create_factorial_function_file()