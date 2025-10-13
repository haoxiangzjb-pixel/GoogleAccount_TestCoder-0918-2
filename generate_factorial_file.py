import random
import string


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


# Generate a random filename
random_filename = f"factorial_func_{''.join(random.choices(string.ascii_lowercase + string.digits, k=8))}.py"

# Write the function definition to the random file
with open(random_filename, 'w') as f:
    f.write('# Factorial Function\n\n')
    f.write('def factorial(n):\n')
    f.write('    """Calculates the factorial of a non-negative integer n."""\n')
    f.write('    if n < 0:\n')
    f.write('        raise ValueError("Factorial is not defined for negative numbers.")\n')
    f.write('    if n == 0 or n == 1:\n')
    f.write('        return 1\n')
    f.write('    result = 1\n')
    f.write('    for i in range(2, n + 1):\n')
    f.write('        result *= i\n')
    f.write('    return result\n')

print(f"Factorial function saved to {random_filename}")
print(f"Factorial of 5 is {factorial(5)}")
