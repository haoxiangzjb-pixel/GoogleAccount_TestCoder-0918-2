const { filterEvens } = require('./filter_evens');
const fs = require('fs');
const path = require('path');

const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evens = filterEvens(testArray);

const randomFileName = `output_${Math.random().toString(36).substring(2, 10)}.txt`;
const filePath = path.join(__dirname, randomFileName);

fs.writeFileSync(filePath, evens.join(', '));

console.log(`Filtered evens: ${evens}`);
console.log(`Saved to file: ${filePath}`);