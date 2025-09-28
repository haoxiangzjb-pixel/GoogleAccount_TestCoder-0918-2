import { useState } from 'react';

// 自定义Hook: useCounter
// 接收一个初始值，默认为0
function useCounter(initialValue = 0) {
  // 使用内部的useState来管理状态
  const [count, setCount] = useState(initialValue);

  // 定义可以修改状态的操作
  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialValue);

  // 返回状态值和操作函数
  return { count, increment, decrement, reset };
}

export default useCounter;