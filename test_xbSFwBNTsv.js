// test_xbSFwBNTsv.js - Mocha tests for calculator functions

const { add, subtract, multiply, divide } = require('./calculator');
const assert = require('assert');

describe('Calculator Tests', function() {
  describe('add()', function() {
    it('should add two positive numbers correctly', function() {
      const result = add(2, 3);
      assert.strictEqual(result, 5);
    });

    it('should add negative numbers correctly', function() {
      const result = add(-2, -3);
      assert.strictEqual(result, -5);
    });

    it('should handle adding zero', function() {
      const result = add(5, 0);
      assert.strictEqual(result, 5);
    });
  });

  describe('subtract()', function() {
    it('should subtract two positive numbers correctly', function() {
      const result = subtract(5, 3);
      assert.strictEqual(result, 2);
    });

    it('should handle negative results', function() {
      const result = subtract(3, 5);
      assert.strictEqual(result, -2);
    });
  });

  describe('multiply()', function() {
    it('should multiply two positive numbers correctly', function() {
      const result = multiply(3, 4);
      assert.strictEqual(result, 12);
    });

    it('should handle multiplication by zero', function() {
      const result = multiply(5, 0);
      assert.strictEqual(result, 0);
    });

    it('should handle negative numbers', function() {
      const result = multiply(-2, 3);
      assert.strictEqual(result, -6);
    });
  });

  describe('divide()', function() {
    it('should divide two positive numbers correctly', function() {
      const result = divide(8, 2);
      assert.strictEqual(result, 4);
    });

    it('should handle decimal results', function() {
      const result = divide(7, 2);
      assert.strictEqual(result, 3.5);
    });

    it('should throw error when dividing by zero', function() {
      assert.throws(() => divide(5, 0), Error, "Division by zero is not allowed");
    });
  });
});