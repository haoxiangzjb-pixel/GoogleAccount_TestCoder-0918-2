// test_jb6Lii42S3.js - Mocha tests for calculator module

const { add, subtract, multiply, divide } = require('./calculator');
const assert = require('assert');

describe('Calculator Tests', function() {
  describe('add()', function() {
    it('should add two positive numbers correctly', function() {
      assert.strictEqual(add(2, 3), 5);
    });

    it('should add negative numbers correctly', function() {
      assert.strictEqual(add(-2, -3), -5);
    });

    it('should handle adding zero', function() {
      assert.strictEqual(add(5, 0), 5);
    });
  });

  describe('subtract()', function() {
    it('should subtract two positive numbers correctly', function() {
      assert.strictEqual(subtract(5, 3), 2);
    });

    it('should handle negative results', function() {
      assert.strictEqual(subtract(3, 5), -2);
    });
  });

  describe('multiply()', function() {
    it('should multiply two positive numbers correctly', function() {
      assert.strictEqual(multiply(3, 4), 12);
    });

    it('should handle multiplication by zero', function() {
      assert.strictEqual(multiply(5, 0), 0);
    });

    it('should handle negative numbers', function() {
      assert.strictEqual(multiply(-3, 4), -12);
    });
  });

  describe('divide()', function() {
    it('should divide two positive numbers correctly', function() {
      assert.strictEqual(divide(8, 2), 4);
    });

    it('should handle decimal results', function() {
      assert.strictEqual(divide(7, 2), 3.5);
    });

    it('should throw error when dividing by zero', function() {
      assert.throws(() => divide(5, 0), Error);
    });
  });
});