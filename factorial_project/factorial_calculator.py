import random
import string


def generate_random_filename(extension='.py'):
    """Generates a random filename with the given extension."""
    letters_and_digits = string.ascii_letters + string.digits
    random_string = ''.join(random.choice(letters_and_digits) for _ in range(10))
    return f"factorial_{random_string}{extension}"


def calculate_factorial(n):
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
        return n * calculate_factorial(n - 1)


def main():
    """Main function to demonstrate the factorial calculation and save it to a file."""
    filename = generate_random_filename()
    print(f"Generating code in file: {filename}")

    code_content = f'''
def factorial(n):
    """Calculates the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Example usage:
if __name__ == "__main__":
    number = 5
    print(f"The factorial of {{number}} is {{factorial(number)}}")
'''

    with open(filename, 'w') as f:
        f.write(code_content)

    print(f"Code written to {filename}")


if __name__ == "__main__":
    main()