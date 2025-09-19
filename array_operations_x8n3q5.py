# Python script for basic array operations

def array_sum(arr):
    """Calculate the sum of an array"""
    return sum(arr)

def array_mean(arr):
    """Calculate the mean of an array"""
    return sum(arr) / len(arr) if arr else 0

def demonstrate_operations():
    """Demonstrate array operations"""
    # Create a sample array
    sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    # Calculate sum and mean
    total = array_sum(sample_array)
    avg = array_mean(sample_array)
    
    # Display results
    print("Sample Array:", sample_array)
    print("Sum:", total)
    print("Mean:", avg)
    
    # Additional example with a random array
    import random
    random_array = [random.randint(1, 100) for _ in range(5)]
    print("\nRandom Array:", random_array)
    print("Sum:", array_sum(random_array))
    print("Mean:", array_mean(random_array))

# Run the demonstration
if __name__ == "__main__":
    demonstrate_operations()