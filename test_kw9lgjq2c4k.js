const { expect } = require('chai');
const { add } = require('./src/mathUtils');

describe('MathUtils', function() {
  describe('add', function() {
    it('should add two numbers correctly', function() {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should handle negative numbers', function() {
      const result = add(-1, 1);
      expect(result).to.equal(0);
    });
  });
});