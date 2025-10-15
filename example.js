// Example of using the filterEvenNumbersAndSave function
const { filterEvenNumbersAndSave } = require('./filterEvenNumbers.js');

// Test with different arrays
const testArrays = [
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
  [1, 3, 5, 7, 9], // All odd numbers
  [2, 4, 6, 8, 10], // All even numbers
  [-4, -3, -2, -1, 0, 1, 2, 3, 4] // Including negative numbers
];

testArrays.forEach((arr, index) => {
  console.log(`\nTest ${index + 1}: Input array: [${arr.join(', ')}]`);
  const filePath = filterEvenNumbersAndSave(arr);
  console.log(`Saved to: ${filePath}`);
});