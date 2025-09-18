import random
import string

def generate_random_filename(extension=".py"):
    """Generates a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension

def sum_list(numbers):
    """
    Sums a list of numbers.
    
    Args:
        numbers: A list of numbers (int or float).
        
    Returns:
        The sum of all numbers in the list.
    """
    return sum(numbers)

if __name__ == "__main__":
    # Example usage
    example_list = [1, 2, 3, 4, 5]
    result = sum_list(example_list)
    print(f"Sum of {example_list} is {result}")
    
    # Save to a file with a random name
    filename = generate_random_filename()
    print(f"Function saved in file: {filename}")