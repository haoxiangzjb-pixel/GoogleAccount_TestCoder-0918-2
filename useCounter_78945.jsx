import { useState } from 'react';

/**
 * 自定义Hook: useCounter
 * 用于管理计数器状态
 * @param {number} initialValue - 初始值，默认为0
 * @returns {object} - 包含count值和操作函数的对象
 */
function useCounter(initialValue = 0) {
  const [count, setCount] = useState(initialValue);

  // 增加计数
  const increment = () => {
    setCount(prevCount => prevCount + 1);
  };

  // 减少计数
  const decrement = () => {
    setCount(prevCount => prevCount - 1);
  };

  // 重置计数
  const reset = () => {
    setCount(initialValue);
  };

  // 设置特定值
  const set = (value) => {
    setCount(value);
  };

  return {
    count,
    increment,
    decrement,
    reset,
    set
  };
}

export default useCounter;