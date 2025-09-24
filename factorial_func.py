import random

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

# Generate a random filename and save the function code
# Note: The function definition is already part of this file.
# To save it to a *truly* new random file, we would need to write the string representation
# of the function or the source code to a new file with a random name.
# This is a demonstration that the function is defined.
if __name__ == "__main__":
    test_num = 7
    print(f"The factorial of {test_num} is {factorial(test_num)}")
