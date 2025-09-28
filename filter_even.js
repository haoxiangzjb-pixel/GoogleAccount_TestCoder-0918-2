const fs = require('fs');

// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Even numbers:", evenNumbers);

// Generate a random filename
const randomFileName = `filtered_evens_${Math.floor(Math.random() * 1000000)}.json`;

// Save the filtered array to a JSON file
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));
console.log(`Filtered even numbers saved to ${randomFileName}`);

