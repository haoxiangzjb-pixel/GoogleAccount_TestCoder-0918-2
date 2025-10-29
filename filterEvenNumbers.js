// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    if (!Array.isArray(arr)) {
        throw new Error('Input must be an array');
    }
    
    return arr.filter(num => {
        if (typeof num !== 'number' || !Number.isInteger(num)) {
            throw new Error('Array must contain only integers');
        }
        return num % 2 === 0;
    });
}

// Function to generate a random filename
function generateRandomFilename(extension = '.txt') {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < 10; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result + extension;
}

// Function to save filtered even numbers to a randomly named file
function saveEvenNumbersToFile(arr, fileExtension = '.json') {
    try {
        const evenNumbers = filterEvenNumbers(arr);
        const randomFilename = generateRandomFilename(fileExtension);
        
        // Convert to JSON string to save
        const dataToSave = JSON.stringify(evenNumbers, null, 2);
        
        // Using Node.js fs module to write file
        const fs = require('fs');
        fs.writeFileSync(randomFilename, dataToSave);
        
        console.log(`Filtered even numbers saved to: ${randomFilename}`);
        console.log('Even numbers:', evenNumbers);
        
        return randomFilename;
    } catch (error) {
        console.error('Error:', error.message);
        throw error;
    }
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFileName = saveEvenNumbersToFile(numbers);

module.exports = { filterEvenNumbers, saveEvenNumbersToFile, generateRandomFilename };