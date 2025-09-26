const fs = require('fs');
const path = require('path');

// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
  if (!Array.isArray(inputArray)) {
    throw new Error("Input must be an array.");
  }
  return inputArray.filter(num => typeof num === 'number' && num % 2 === 0);
}

const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

// Generate a random filename
const randomFileName = path.join('/workspace', 'filtered_evens_' + Math.random().toString(36).substring(2, 10) + '.json');

// Write the result to the random file
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));
console.log('Filtered even numbers saved to:', randomFileName);
