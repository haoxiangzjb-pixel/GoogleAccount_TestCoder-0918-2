import React, { useState } from 'react';

const App = () => {
  const [inputValue, setInputValue] = useState('');
  const [items, setItems] = useState([]);

  const addItem = () => {
    if (inputValue.trim() !== '') {
      setItems([...items, { id: Date.now(), text: inputValue, completed: false }]);
      setInputValue('');
    }
  };

  const toggleItem = (id) => {
    setItems(
      items.map(item =>
        item.id === id ? { ...item, completed: !item.completed } : item
      )
    );
  };

  const deleteItem = (id) => {
    setItems(items.filter(item => item.id !== id));
  };

  return (
    <div>
      <h1>My To-Do List</h1>
      <div>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          placeholder="Add a new task..."
        />
        <button onClick={addItem}>Add</button>
      </div>
      <ul>
        {items.map(item => (
          <li key={item.id} style={{ textDecoration: item.completed ? 'line-through' : 'none' }}>
            {item.text}
            <button onClick={() => toggleItem(item.id)} style={{ marginLeft: '10px' }}>
              {item.completed ? 'Undo' : 'Complete'}
            </button>
            <button onClick={() => deleteItem(item.id)} style={{ marginLeft: '5px' }}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default App;