const Counter = (props) => {
  const initialCount = props && props.initialCount !== undefined ? props.initialCount : 0;
  let count = initialCount;
  
  const increment = () => { count++; };
  const decrement = () => { count--; };
  const reset = () => { count = 0; };
  const getCount = () => count;
  
  return {
    increment,
    decrement,
    reset,
    getCount
  };
};

// Simple test framework
const tests = [];

function test(description, fn) {
  tests.push({ description, fn });
}

function expect(value) {
  return {
    toBe: (expected) => {
      if (value !== expected) {
        throw new Error(`Expected ${expected} but got ${value}`);
      }
    }
  };
}

// Tests
test('Counter initializes with correct value', () => {
  const counter = Counter({ initialCount: 5 });
  expect(counter.getCount()).toBe(5);
});

test('Counter increments correctly', () => {
  const counter = Counter();
  counter.increment();
  expect(counter.getCount()).toBe(1);
});

test('Counter decrements correctly', () => {
  const counter = Counter();
  counter.decrement();
  expect(counter.getCount()).toBe(-1);
});

test('Counter resets correctly', () => {
  const counter = Counter({ initialCount: 10 });
  counter.reset();
  expect(counter.getCount()).toBe(0);
});

// Run tests
let passed = 0;
let failed = 0;

tests.forEach(({ description, fn }) => {
  try {
    fn();
    console.log(`✓ ${description}`);
    passed++;
  } catch (error) {
    console.log(`✗ ${description}: ${error.message}`);
    failed++;
  }
});

console.log(`\nTests: ${passed} passed, ${failed} failed`);

if (failed > 0) {
  process.exit(1);
}