const fs = require('fs');
const { filterEvenNumbers } = require('./filter_even.js');

const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evens = filterEvenNumbers(numbers);

// Generate a random filename
const randomFileName = `filtered_evens_${Math.random().toString(36).substring(2, 10)}.json`;

// Write the filtered array to the file
fs.writeFileSync(randomFileName, JSON.stringify(evens, null, 2));
console.log('Filtered even numbers saved to ' + randomFileName);
