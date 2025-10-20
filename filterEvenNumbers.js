// Function to filter even numbers from an array and save them to a randomly named file
const fs = require('fs');
const path = require('path');

function filterAndSaveEvenNumbers(inputArray) {
    // Filter even numbers from the array
    const evenNumbers = inputArray.filter(num => num % 2 === 0);
    
    // Generate a random filename
    const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
    
    // Convert the array to JSON string
    const dataToSave = JSON.stringify(evenNumbers, null, 2);
    
    // Write the data to the randomly named file
    const filePath = path.join(__dirname, randomFileName);
    fs.writeFileSync(filePath, dataToSave);
    
    console.log(`Even numbers filtered and saved to: ${filePath}`);
    console.log(`Even numbers: [${evenNumbers.join(', ')}]`);
    
    return filePath;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterAndSaveEvenNumbers(numbers);

module.exports = { filterAndSaveEvenNumbers };