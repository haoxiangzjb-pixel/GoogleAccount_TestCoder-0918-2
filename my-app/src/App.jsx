import React from 'react';
import useCounter from './useCounter'; // 导入自定义Hook

const App = () => {
  // 使用自定义Hook
  const { count, increment, decrement, reset } = useCounter(0);

  return (
    <div>
      <h1>计数器示例</h1>
      <p>当前计数: {count}</p>
      <button onClick={increment}>增加</button>
      <button onClick={decrement}>减少</button>
      <button onClick={reset}>重置</button>
    </div>
  );
};

export default App;