import { useState } from 'react'
import './App.css'

function App() {
  const [todos, setTodos] = useState([
    { id: 1, text: 'Купить молоко', completed: false },
    { id: 2, text: 'Изучить React', completed: true },
    { id: 3, text: 'Написать код', completed: false },
  ]);
  const [newTodo, setNewTodo] = useState('');

  const addTodo = () => {
    if (newTodo.trim() !== '') {
      setTodos([...todos, { id: Date.now(), text: newTodo, completed: false }]);
      setNewTodo('');
    }
  };

  const toggleTodo = (id) => {
    setTodos(
      todos.map(todo =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    );
  };

  return (
    <div className="todo-app">
      <h1>Список дел</h1>
      <div className="input-container">
        <input
          type="text"
          value={newTodo}
          onChange={(e) => setNewTodo(e.target.value)}
          placeholder="Добавить новое дело..."
        />
        <button onClick={addTodo}>Добавить</button>
      </div>
      <ul className="todo-list">
        {todos.map(todo => (
          <li key={todo.id} className={todo.completed ? 'completed' : ''}>
            <span onClick={() => toggleTodo(todo.id)}>{todo.text}</span>
          </li>
        ))}
      </ul>
    </div>
  )
}

export default App
