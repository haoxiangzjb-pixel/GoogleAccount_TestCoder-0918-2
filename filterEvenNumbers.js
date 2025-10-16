// Function to filter even numbers from an array and save to a random named file
const fs = require('fs');
const path = require('path');

function filterAndSaveEvenNumbers(numbers) {
  // Filter even numbers from the array
  const evenNumbers = numbers.filter(num => num % 2 === 0);
  
  // Generate a random filename
  const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
  const filePath = path.join(__dirname, randomFileName);
  
  // Save the even numbers to the file
  fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
  
  console.log(`Even numbers saved to: ${filePath}`);
  console.log('Filtered even numbers:', evenNumbers);
  
  return filePath;
}

// Example usage:
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
filterAndSaveEvenNumbers(testArray);

module.exports = { filterAndSaveEvenNumbers };