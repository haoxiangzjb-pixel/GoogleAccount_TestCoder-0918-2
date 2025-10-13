// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

// Export the function for potential use elsewhere
module.exports = { filterEvenNumbers };
