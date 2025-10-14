function fibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return;
  } else if (n === 1) {
    console.log(0);
    return;
  }

  let sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }

  console.log(sequence.join(", "));
}

// Example usage:
fibonacci(10); // Outputs: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34