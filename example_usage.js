// Example usage of the filterEvenNumbersAndSave function

// Import the function
const { filterEvenNumbersAndSave } = require('./filterEvenNumbers');

// Example 1: Basic usage
console.log('Example 1: Basic usage');
const numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const result1 = filterEvenNumbersAndSave(numbers1);
console.log('Filtered even numbers:', result1.evenNumbers);
console.log('Saved to file:', result1.fileName);
console.log('');

// Example 2: Array with negative numbers
console.log('Example 2: Array with negative numbers');
const numbers2 = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
const result2 = filterEvenNumbersAndSave(numbers2);
console.log('Filtered even numbers:', result2.evenNumbers);
console.log('Saved to file:', result2.fileName);
console.log('');

// Example 3: Array with no even numbers
console.log('Example 3: Array with no even numbers');
const numbers3 = [1, 3, 5, 7, 9];
const result3 = filterEvenNumbersAndSave(numbers3);
console.log('Filtered even numbers:', result3.evenNumbers);
console.log('Saved to file:', result3.fileName);
console.log('');

// Example 4: Array with mixed data types (only numbers will be considered)
console.log('Example 4: Array with mixed data types');
const numbers4 = [1, 2, 'hello', 4, null, 6, undefined, 8, true, 10];
const result4 = filterEvenNumbersAndSave(numbers4);
console.log('Filtered even numbers:', result4.evenNumbers);
console.log('Saved to file:', result4.fileName);