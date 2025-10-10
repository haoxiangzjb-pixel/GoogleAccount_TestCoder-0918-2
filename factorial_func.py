import math

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
    
    # Using math.prod for efficiency (available in Python 3.8+)
    # Fallback to a loop for older versions or for explicit implementation
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Example usage (optional, can be removed)
if __name__ == "__main__":
    print(factorial(5))  # Output: 120
    print(factorial(0))  # Output: 1