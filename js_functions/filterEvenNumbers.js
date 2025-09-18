/**
 * Filters even numbers from an array.
 * @param {number[]} numbers - The array of numbers to filter.
 * @returns {number[]} A new array containing only the even numbers.
 */
function filterEvenNumbers(numbers) {
    return numbers.filter(num => num % 2 === 0);
}

// Example usage:
const inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(inputArray);
console.log('Original array:', inputArray);
console.log('Even numbers:', evenNumbers);

module.exports = filterEvenNumbers;