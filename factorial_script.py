import random
import string

def factorial(n):
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

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Generate a random filename
filename = generate_random_filename()
print(f"Saving to file: {filename}")

# Save the function to the randomly named file
with open(filename, 'w') as f:
    f.write("def factorial(n):\n")
    f.write("    \"\"\"\n")
    f.write("    Calculate the factorial of a number.\n")
    f.write("    \n")
    f.write("    Args:\n")
    f.write("        n (int): A non-negative integer\n")
    f.write("        \n")
    f.write("    Returns:\n")
    f.write("        int: The factorial of n\n")
    f.write("        \n")
    f.write("    Raises:\n")
    f.write("        ValueError: If n is negative\n")
    f.write("        TypeError: If n is not an integer\n")
    f.write("    \"\"\"\n")
    f.write("    if not isinstance(n, int):\n")
    f.write("        raise TypeError(\"Input must be an integer\")\n")
    f.write("    if n < 0:\n")
    f.write("        raise ValueError(\"Factorial is not defined for negative numbers\")\n")
    f.write("    \n")
    f.write("    if n == 0 or n == 1:\n")
    f.write("        return 1\n")
    f.write("    \n")
    f.write("    result = 1\n")
    f.write("    for i in range(2, n + 1):\n")
    f.write("        result *= i\n")
    f.write("    return result\n")
    f.write("\n")
    f.write("# Example usage\n")
    f.write("if __name__ == \"__main__\":\n")
    f.write("    print(factorial(5))  # Should print 120\n")
    f.write("    print(factorial(0))  # Should print 1\n")