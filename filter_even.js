// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
    return inputArray.filter(num => num % 2 === 0);
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

// Generate a random filename
const randomFileName = `filtered_evens_${Math.floor(Math.random() * 1000000)}.txt`;

// Save the result to the random file
const fs = require('fs');
fs.writeFileSync(randomFileName, `Original array: ${numbers}\nFiltered even numbers: ${evenNumbers}`);

console.log(`Results saved to ${randomFileName}`);