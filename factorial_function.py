import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
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


def save_factorial_function_to_random_file():
    """
    Save the factorial function to a randomly named Python file.
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    filename = f"{random_name}.py"
    
    # Write the function to the random file
    with open(filename, 'w') as f:
        f.write('''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
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
    
    return result''')
    
    print(f"Factorial function saved to {filename}")
    return filename


# Example usage:
if __name__ == "__main__":
    # Test the factorial function
    print("Testing factorial function:")
    for i in range(6):
        print(f"{i}! = {factorial(i)}")
    
    # Save to random file
    random_filename = save_factorial_function_to_random_file()