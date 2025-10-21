import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n (n!)
    
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
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result

def save_factorial_function_to_random_file():
    """Save the factorial function to a randomly named file."""
    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Content to write to the file
    file_content = '''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n (n!)
    
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
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result
'''
    
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    print(f"Factorial function saved to: {random_filename}")
    return random_filename

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print(f"Factorial of 5: {factorial(5)}")
    
    # Save to a random file
    random_file = save_factorial_function_to_random_file()