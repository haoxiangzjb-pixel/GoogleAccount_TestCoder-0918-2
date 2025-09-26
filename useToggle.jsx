import { useState } from 'react';

// A custom hook to manage a toggle state (true/false)
export const useToggle = (initialValue = false) => {
  const [value, setValue] = useState(initialValue);

  const toggle = () => {
    setValue(prevValue => !prevValue);
  };

  const setTrue = () => {
    setValue(true);
  };

  const setFalse = () => {
    setValue(false);
  };

  return [value, { toggle, setTrue, setFalse }];
};