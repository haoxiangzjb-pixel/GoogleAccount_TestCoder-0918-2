import { useState } from 'react';

// Custom hook that manages input state with validation
const useInput = (initialValue = '', validator = null) => {
  const [value, setValue] = useState(initialValue);
  const [error, setError] = useState('');

  const handleChange = (newValue) => {
    setValue(newValue);
    
    if (validator) {
      const isValid = validator(newValue);
      setError(isValid ? '' : 'Invalid input');
    }
  };

  const reset = () => {
    setValue(initialValue);
    setError('');
  };

  return {
    value,
    error,
    onChange: handleChange,
    reset
  };
};

export default useInput;