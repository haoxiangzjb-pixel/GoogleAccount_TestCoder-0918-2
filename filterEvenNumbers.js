// Function to filter even numbers from an array and save to a randomly named file
const fs = require('fs');
const path = require('path');

function filterAndSaveEvenNumbers(inputArray) {
    // Validate input
    if (!Array.isArray(inputArray)) {
        throw new Error('Input must be an array');
    }
    
    // Filter even numbers from the input array
    const evenNumbers = inputArray.filter(num => typeof num === 'number' && num % 2 === 0);
    
    // Generate a random filename
    const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
    const filePath = path.join(__dirname, randomFileName);
    
    // Convert the even numbers array to JSON string
    const jsonString = JSON.stringify(evenNumbers, null, 2);
    
    // Write the JSON string to the file
    fs.writeFileSync(filePath, jsonString);
    
    console.log(`Even numbers filtered and saved to: ${filePath}`);
    console.log(`Filtered even numbers:`, evenNumbers);
    
    return {
        filePath: filePath,
        evenNumbers: evenNumbers
    };
}

// Example usage
console.log("Example 1:");
const sampleArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const result = filterAndSaveEvenNumbers(sampleArray);

console.log("\nExample 2:");
const anotherArray = [17, 22, 33, 44, 55, 66, 77, 88];
const result2 = filterAndSaveEvenNumbers(anotherArray);

console.log("\nExample 3 - with negative numbers:");
const arrayWithNegatives = [-4, -3, -2, -1, 0, 1, 2, 3, 4];
const result3 = filterAndSaveEvenNumbers(arrayWithNegatives);

module.exports = { filterAndSaveEvenNumbers };