def factorial(n):
    """
    Calculate the factorial of a number.

    Args:
        n (int): The number to calculate the factorial of.

    Returns:
        int: The factorial of n.
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    elif n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result

# Example usage:
# print(factorial(5))  # Output: 120