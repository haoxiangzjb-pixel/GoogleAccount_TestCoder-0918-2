const { v4: uuidv4 } = require('uuid');
const fs = require('fs');
const { filterEvenNumbers } = require('./filter_even.js');

// Function to save even numbers to a file with a random name
function saveEvenNumbersToFile(inputArray) {
    const evenNumbers = filterEvenNumbers(inputArray);
    const randomFileName = `even_numbers_${uuidv4().slice(0, 8)}.json`;
    fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));
    console.log(`Filtered even numbers saved to file: ${randomFileName}`);
    return randomFileName;
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
saveEvenNumbersToFile(numbers);