// Function to filter even numbers from an array and save to a randomly named file
function filterEvenNumbersAndSave(arr) {
  // Validate input
  if (!Array.isArray(arr)) {
    throw new Error('Input must be an array');
  }
  
  // Filter even numbers from the input array
  const evenNumbers = arr.filter(num => typeof num === 'number' && num % 2 === 0);
  
  // Generate a random filename
  const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
  
  // Convert the array to JSON string
  const jsonString = JSON.stringify(evenNumbers);
  
  // Write the JSON string to the file
  const fs = require('fs');
  fs.writeFileSync(randomFileName, jsonString);
  
  console.log(`Even numbers saved to ${randomFileName}`);
  return { evenNumbers, fileName: randomFileName };
}

// Export the function for use in other files
module.exports = { filterEvenNumbersAndSave };

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
filterEvenNumbersAndSave(numbers);