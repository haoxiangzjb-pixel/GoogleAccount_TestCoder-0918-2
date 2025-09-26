const assert = require('assert');

// The function to be tested
function add(a, b) {
  return a + b;
}

// Mocha test suite
describe('Addition Function', () => {
  it('should add two positive numbers correctly', () => {
    assert.strictEqual(add(2, 3), 5);
  });

  it('should add two negative numbers correctly', () => {
    assert.strictEqual(add(-2, -3), -5);
  });

  it('should add a positive and a negative number correctly', () => {
    assert.strictEqual(add(5, -3), 2);
  });

  it('should add zero to a number correctly', () => {
    assert.strictEqual(add(42, 0), 42);
  });
});
