import React from 'react';
import TodoList from './TodoList';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Мое приложение React</h1>
      </header>
      <main>
        <TodoList />
      </main>
    </div>
  );
}

export default App;