// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
  if (!Array.isArray(inputArray)) {
    throw new Error("Input must be an array.");
  }
  return inputArray.filter(num => typeof num === 'number' && num % 2 === 0);
}

// Function to save data to a file with a random name
function saveToFileWithRandomName(data, extension = 'txt') {
  const fs = require('fs');
  const crypto = require('crypto');

  // Generate a random filename using a random UUID
  const randomFileName = `output_${crypto.randomUUID()}.${extension}`;
  const filePath = `/workspace/${randomFileName}`;

  // Write the data to the file
  fs.writeFileSync(filePath, data, 'utf8');
  console.log(`Data successfully written to ${filePath}`);
  return filePath;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

const dataToSave = evenNumbers.join(', ');
const savedFilePath = saveToFileWithRandomName(dataToSave, 'json');
console.log("File saved at:", savedFilePath);
