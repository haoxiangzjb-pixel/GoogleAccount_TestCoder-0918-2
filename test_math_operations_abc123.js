const { expect } = require('chai');
const { add, subtract, multiply, divide } = require('./math_operations');

describe('Math Operations', function() {
  describe('add function', function() {
    it('should add two positive numbers correctly', function() {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should add negative numbers correctly', function() {
      const result = add(-2, -3);
      expect(result).to.equal(-5);
    });

    it('should add positive and negative numbers correctly', function() {
      const result = add(5, -3);
      expect(result).to.equal(2);
    });
  });

  describe('subtract function', function() {
    it('should subtract two numbers correctly', function() {
      const result = subtract(5, 3);
      expect(result).to.equal(2);
    });

    it('should handle negative results', function() {
      const result = subtract(3, 5);
      expect(result).to.equal(-2);
    });
  });

  describe('multiply function', function() {
    it('should multiply two positive numbers correctly', function() {
      const result = multiply(3, 4);
      expect(result).to.equal(12);
    });

    it('should handle multiplication with zero', function() {
      const result = multiply(5, 0);
      expect(result).to.equal(0);
    });

    it('should handle negative multiplication', function() {
      const result = multiply(-3, 4);
      expect(result).to.equal(-12);
    });
  });

  describe('divide function', function() {
    it('should divide two numbers correctly', function() {
      const result = divide(10, 2);
      expect(result).to.equal(5);
    });

    it('should handle decimal results', function() {
      const result = divide(7, 2);
      expect(result).to.equal(3.5);
    });

    it('should throw error when dividing by zero', function() {
      expect(() => divide(10, 0)).to.throw('Division by zero is not allowed');
    });
  });
});