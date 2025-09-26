import random
import os

def factorial(n):
    """Calculate the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Generate a random filename
random_filename = f"factorial_func_{random.randint(1000, 9999)}.py"

# Write the function definition to the randomly named file
with open(random_filename, 'w') as f:
    f.write('# Factorial function\n\n')
    f.write('def factorial(n):\n')
    f.write('    """Calculate the factorial of a non-negative integer n."""\n')
    f.write('    if n < 0:\n')
    f.write('        raise ValueError("Factorial is not defined for negative numbers.")\n')
    f.write('    if n == 0 or n == 1:\n')
    f.write('        return 1\n')
    f.write('    result = 1\n')
    f.write('    for i in range(2, n + 1):\n')
    f.write('        result *= i\n')
    f.write('    return result\n')

print(f"Factorial function saved to {random_filename}")
