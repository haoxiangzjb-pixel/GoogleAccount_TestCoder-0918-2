const { add, subtract } = require('./calculator');
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

    it('should handle subtracting zero', function() {
      const result = subtract(5, 0);
      assert.strictEqual(result, 5);
    });
  });
});