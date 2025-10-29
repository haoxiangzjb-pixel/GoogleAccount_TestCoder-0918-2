/**
 * Generates and outputs the Fibonacci sequence up to n terms
 * @param {number} n - Number of terms in the Fibonacci sequence
 */
function fibonacciSequence(n) {
    if (n <= 0) {
        console.log("Please enter a positive number");
        return;
    } else if (n === 1) {
        console.log("Fibonacci sequence:");
        console.log(0);
        return;
    } else if (n === 2) {
        console.log("Fibonacci sequence:");
        console.log(0);
        console.log(1);
        return;
    }

    // Initialize the first two terms
    let first = 0;
    let second = 1;
    
    console.log("Fibonacci sequence:");
    console.log(first);
    console.log(second);
    
    // Generate and print the remaining terms
    for (let i = 2; i < n; i++) {
        let next = first + second;
        console.log(next);
        first = second;
        second = next;
    }
}

// Example usage:
// fibonacciSequence(10);