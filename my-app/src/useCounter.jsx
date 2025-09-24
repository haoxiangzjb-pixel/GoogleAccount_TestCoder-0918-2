import { useState } from 'react';

// 自定义Hook: useCounter
// 接收一个初始值，默认为0
const useCounter = (initialValue = 0) => {
  // 使用useState来管理计数器状态
  const [count, setCount] = useState(initialValue);

  // 定义修改状态的函数
  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialValue);

  // 返回状态和操作函数，供调用者使用
  return { count, increment, decrement, reset };
};

export default useCounter;