import { useState } from 'react';

/**
 * A custom React Hook that manages a counter state.
 * @param {number} initialValue - The initial value for the counter. Defaults to 0.
 * @returns {Array} An array containing the current count, increment function, and reset function.
 */
function useCounter(initialValue = 0) {
  const [count, setCount] = useState(initialValue);

  const increment = () => setCount(prevCount => prevCount + 1);
  const reset = () => setCount(initialValue);

  return [count, increment, reset];
}

export default useCounter;