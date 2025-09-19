import random
import string


def generate_random_filename(extension='.py'):
    """Generates a random filename with the given extension."""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"factorial_{random_chars}{extension}"


def factorial(n):
    """
    Calculates the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
        TypeError: If n is not an integer.
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer.")
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")

    if n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result


def save_factorial_function(filename):
    """Saves the factorial function to a Python file."""
    function_code = '''
def factorial(n):
    """
    Calculates the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
        TypeError: If n is not an integer.
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer.")
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")

    if n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result
'''
    with open(filename, 'w') as f:
        f.write(function_code)
    print(f"Function saved to {filename}")


if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()

    # Save the function to the file
    save_factorial_function(filename)

    # Demonstrate usage
    try:
        number = 5
        # We need to import the function from the generated file to use it directly here for demo
        # But for simplicity, we'll just call the one defined in this script.
        result = factorial(number)
        print(f"The factorial of {number} is {result}")
    except (ValueError, TypeError) as e:
        print(e)