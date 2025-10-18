import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{extension}"

# Save the factorial function to a randomly named file
def save_factorial_function():
    """Save the factorial function to a randomly named Python file."""
    # Generate random filename
    filename = generate_random_filename(".py")
    
    # Content to write to the file
    function_content = '''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
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
    
    # Write the function to the randomly named file
    with open(filename, 'w') as file:
        file.write(function_content)
    
    print(f"Factorial function saved to {filename}")
    return filename

# Run the function to create the file
if __name__ == "__main__":
    saved_file = save_factorial_function()
    print(f"Created file: {saved_file}")