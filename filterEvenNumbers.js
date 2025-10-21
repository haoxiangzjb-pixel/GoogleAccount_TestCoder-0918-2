/**
 * Filters even numbers from an array and saves them to a randomly named file
 * @param {number[]} array - The input array of numbers
 * @param {string} [directory='/workspace'] - Optional directory to save the file (default is /workspace)
 * @returns {string} - The name of the file that was created
 */
function filterEvenNumbersAndSave(array, directory = '/workspace') {
    // Filter even numbers from the array
    const evenNumbers = array.filter(num => num % 2 === 0);
    
    // Generate a random filename
    const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
    const filePath = `${directory}/${randomFileName}`;
    
    // Convert the array to JSON string
    const jsonString = JSON.stringify(evenNumbers, null, 2);
    
    // Write the JSON string to the file
    const fs = require('fs');
    fs.writeFileSync(filePath, jsonString);
    
    console.log(`Even numbers filtered and saved to: ${filePath}`);
    console.log(`Filtered even numbers: [${evenNumbers.join(', ')}]`);
    
    return filePath;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFileName = filterEvenNumbersAndSave(numbers);

module.exports = { filterEvenNumbersAndSave };