const { add } = require('./utils.js');

describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    // Assertion
    if (result !== 5) {
      throw new Error(`Expected 5, but got ${result}`);
    }
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -2);
    // Assertion
    if (result !== 3) {
      throw new Error(`Expected 3, but got ${result}`);
    }
  });

  it('should add two negative numbers correctly', function() {
    const result = add(-1, -1);
    // Assertion
    if (result !== -2) {
      throw new Error(`Expected -2, but got ${result}`);
    }
  });
});