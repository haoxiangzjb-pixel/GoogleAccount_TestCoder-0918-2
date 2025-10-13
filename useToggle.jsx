import { useState } from 'react';

// A custom hook that manages a toggle state (true/false)
export const useToggle = (initialValue = false) => {
  const [value, setValue] = useState(initialValue);

  const toggle = () => {
    setValue(prevValue => !prevValue);
  };

  return [value, toggle];
};