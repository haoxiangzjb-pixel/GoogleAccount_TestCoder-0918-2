const { expect } = require('chai');
const { add } = require('../src/utils');

describe('Utils', () => {
  describe('add', () => {
    it('should add two numbers correctly', () => {
      expect(add(1, 2)).to.equal(3);
    });

    it('should add negative numbers correctly', () => {
      expect(add(-1, -2)).to.equal(-3);
    });

    it('should add zero correctly', () => {
      expect(add(5, 0)).to.equal(5);
    });
  });
});