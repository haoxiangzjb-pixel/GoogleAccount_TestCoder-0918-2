/**
 * Generates and returns the Fibonacci sequence up to n terms
 * @param {number} n - Number of terms in the Fibonacci sequence
 * @returns {Array} - Array containing the Fibonacci sequence
 */
function fibonacciSequence(n) {
    if (n <= 0) {
        return [];
    } else if (n === 1) {
        return [0];
    } else if (n === 2) {
        return [0, 1];
    }
    
    const sequence = [0, 1];
    
    for (let i = 2; i < n; i++) {
        const nextTerm = sequence[i - 1] + sequence[i - 2];
        sequence.push(nextTerm);
    }
    
    return sequence;
}

/**
 * Outputs the Fibonacci sequence up to n terms to the console
 * @param {number} n - Number of terms in the Fibonacci sequence
 */
function outputFibonacci(n) {
    const fibSequence = fibonacciSequence(n);
    console.log(`Fibonacci sequence up to ${n} terms:`, fibSequence);
    return fibSequence;
}

// Example usage:
// outputFibonacci(10);