// Function to filter even numbers from an array
function filterEvens(numbers) {
  return numbers.filter(num => num % 2 === 0);
}

// Example usage
const originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evensArray = filterEvens(originalArray);

console.log("Original array:", originalArray);
console.log("Filtered evens:", evensArray);

// Generate a random filename
const randomFileName = `evens_output_${Math.floor(Math.random() * 10000)}.txt`;

// Write the result to the random file
const fs = require('fs');
fs.writeFileSync(randomFileName, `Original: ${originalArray.join(', ')}\nEvens: ${evensArray.join(', ')}`);

console.log(`Results saved to ${randomFileName}`);