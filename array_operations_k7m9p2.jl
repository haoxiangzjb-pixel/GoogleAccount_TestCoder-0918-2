# Julia script for basic array operations

# Function to calculate the sum of an array
function array_sum(arr)
    return sum(arr)
end

# Function to calculate the mean of an array
function array_mean(arr)
    return mean(arr)
end

# Function to demonstrate array operations
function demonstrate_operations()
    # Create a sample array
    sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    # Calculate sum and mean
    total = array_sum(sample_array)
    avg = array_mean(sample_array)
    
    # Display results
    println("Sample Array: ", sample_array)
    println("Sum: ", total)
    println("Mean: ", avg)
    
    # Additional example with a random array
    random_array = rand(1:100, 5)
    println("\nRandom Array: ", random_array)
    println("Sum: ", array_sum(random_array))
    println("Mean: ", array_mean(random_array))
end

# Run the demonstration
demonstrate_operations()