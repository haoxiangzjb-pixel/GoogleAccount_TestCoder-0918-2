/**
 * Filters even numbers from an array and returns a new array containing only the even numbers.
 * @param {number[]} array - The input array of numbers.
 * @returns {number[]} A new array containing only the even numbers from the input array.
 */
function filterEvenNumbers(array) {
  if (!Array.isArray(array)) {
    throw new Error("Input must be an array.");
  }
  return array.filter(num => {
    if (typeof num !== 'number' || !Number.isInteger(num)) {
      throw new Error("Array must contain only integers.");
    }
    return num % 2 === 0;
  });
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Even numbers:", evenNumbers);

module.exports = { filterEvenNumbers };
