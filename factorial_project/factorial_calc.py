import random
import string


def generate_random_filename(extension=".py"):
    """Generates a random filename with the given extension."""
    random_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"factorial_{random_str}{extension}"


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


if __name__ == "__main__":
    # Example usage
    try:
        number = 5
        print(f"The factorial of {number} is {factorial(number)}")
    except (ValueError, TypeError) as e:
        print(f"Error: {e}")