import { useState } from 'react';

// A custom hook that manages a list of items and provides functions to add and remove items.
export const useListManager = (initialItems = []) => {
  const [items, setItems] = useState(initialItems);

  const addItem = (item) => {
    setItems(prevItems => [...prevItems, item]);
  };

  const removeItem = (index) => {
    if (index >= 0 && index < items.length) {
      setItems(prevItems => prevItems.filter((_, i) => i !== index));
    }
  };

  return {
    items,
    addItem,
    removeItem
  };
};
