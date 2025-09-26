// Function to generate Fibonacci sequence up to n terms
function fibonacci(n) {
  if (n <= 0) {
    return [];
  } else if (n === 1) {
    return [0];
  }

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    const next = sequence[i - 1] + sequence[i - 2];
    sequence.push(next);
  }
  return sequence;
}

// Example usage:
const n = 10; // Change this to generate a different number of terms
console.log(`Fibonacci sequence up to ${n} terms:`, fibonacci(n));
