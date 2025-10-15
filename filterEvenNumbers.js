// Function to filter even numbers from an array and save to a randomly named file
const fs = require('fs');
const path = require('path');

function filterEvenNumbersAndSave(inputArray) {
  // Filter even numbers from the input array
  const evenNumbers = inputArray.filter(num => num % 2 === 0);
  
  // Generate a random filename
  const randomFileName = `evenNumbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(__dirname, randomFileName);
  
  // Save the even numbers to the file
  try {
    fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
    console.log(`Even numbers saved to: ${filePath}`);
    return filePath;
  } catch (error) {
    console.error('Error saving file:', error);
    throw error;
  }
}

// Export the function for use in other files
module.exports = { filterEvenNumbersAndSave };

// Example usage (uncomment to run when executing this file directly)
// const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
// const savedFilePath = filterEvenNumbersAndSave(testArray);
// console.log('Filtered even numbers:', testArray.filter(num => num % 2 === 0));