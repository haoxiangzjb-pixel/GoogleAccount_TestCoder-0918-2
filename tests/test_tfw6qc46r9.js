const { add } = require('../src/utils');

const assert = require('assert');

describe('Utils: add function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    assert.strictEqual(result, 5);
  });

  it('should handle negative numbers', function() {
    const result = add(-2, 3);
    assert.strictEqual(result, 1);
  });

  it('should throw an error if the first argument is not a number', function() {
    assert.throws(() => add('not a number', 1), Error);
  });

  it('should throw an error if the second argument is not a number', function() {
    assert.throws(() => add(1, null), Error);
  });
});