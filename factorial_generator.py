import random
import string
import os

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

def save_factorial_function():
    """
    Save the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random filename that starts with a letter (to be a valid Python module name)
    random_name = random.choice(string.ascii_lowercase) + ''.join(random.choices(string.ascii_lowercase + string.digits, k=9))
    filename = f"{random_name}.py"
    
    # Define the content to write
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
'''
    
    # Write the content to the file
    with open(filename, 'w') as f:
        f.write(content)
    
    print(f"Factorial function saved to {filename}")
    return filename

if __name__ == "__main__":
    # Save the function to a random file
    saved_file = save_factorial_function()
    print(f"Created file: {saved_file}")
    
    # Test the function
    test_value = 5
    result = factorial(test_value)
    print(f"Factorial of {test_value} is {result}")