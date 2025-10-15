const { calculateSum } = require('./calculateSum');
const assert = require('assert');

describe('calculateSum Function', function() {
    it('should return the sum of two positive numbers', function() {
        const result = calculateSum(2, 3);
        assert.strictEqual(result, 5);
    });

    it('should return the sum of two negative numbers', function() {
        const result = calculateSum(-2, -3);
        assert.strictEqual(result, -5);
    });

    it('should return the sum of a positive and negative number', function() {
        const result = calculateSum(5, -3);
        assert.strictEqual(result, 2);
    });

    it('should return the sum when one number is zero', function() {
        const result = calculateSum(0, 5);
        assert.strictEqual(result, 5);
    });

    it('should return zero when both numbers are zero', function() {
        const result = calculateSum(0, 0);
        assert.strictEqual(result, 0);
    });
});