import random
import string
import os


def generate_random_filename(extension=".py", length=10):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for _ in range(length))
    return f"{random_string}{extension}"


def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result


def save_factorial_function_to_random_file():
    """Save the factorial function to a randomly named Python file."""
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the content to be saved
    content = '''def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
    """
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
    print(f"Factorial of 5 is: {factorial(5)}")
    print(f"Factorial of 0 is: {factorial(0)}")
    print(f"Factorial of 1 is: {factorial(1)}")
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(content)
    
    print(f"Factorial function saved to: {random_filename}")
    return random_filename


# Run the function to create the random file
if __name__ == "__main__":
    save_factorial_function_to_random_file()