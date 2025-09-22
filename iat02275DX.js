/**
 * Generates the Fibonacci sequence up to n terms using a recursive approach with memoization
 * @param {number} n - The number of terms to generate
 * @returns {Array} - Array containing the Fibonacci sequence
 */
function fibonacciRecursive(n, memo = {}) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];
  
  // Initialize the sequence with the first two terms
  const sequence = [0, 1];
  
  // Helper function to calculate Fibonacci numbers recursively with memoization
  function fib(num) {
    if (num in memo) return memo[num];
    if (num <= 1) return num;
    
    memo[num] = fib(num - 1) + fib(num - 2);
    return memo[num];
  }
  
  // Generate the rest of the sequence
  for (let i = 2; i < n; i++) {
    sequence.push(fib(i));
  }
  
  return sequence;
}

// Alternative iterative implementation
function fibonacciIterative(n) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];
  
  const sequence = [0, 1];
  let a = 0, b = 1, next;
  
  for (let i = 2; i < n; i++) {
    next = a + b;
    sequence.push(next);
    a = b;
    b = next;
  }
  
  return sequence;
}

// Example usage:
// console.log(fibonacciRecursive(10));
// console.log(fibonacciIterative(10));

module.exports = { fibonacciRecursive, fibonacciIterative };