import { useState } from 'react';

/**
 * 自定义Hook：用于在本地存储中持久化状态
 * @param {string} key 本地存储的键名
 * @param {*} initialValue 初始值
 * @returns {[*, Function]} 状态值和设置状态的函数
 */
export const useLocalStorage = (key, initialValue) => {
  // 使用函数形式的初始状态，避免每次渲染都调用localStorage.getItem
  const [storedValue, setStoredValue] = useState(() => {
    try {
      const item = window.localStorage.getItem(key);
      // 解析存储的JSON，如果失败则返回初始值
      return item ? JSON.parse(item) : initialValue;
    } catch (error) {
      console.error(`Error reading localStorage key "${key}":`, error);
      return initialValue;
    }
  });

  // 包装useState的setter函数，使其在更新状态的同时更新localStorage
  const setValue = (value) => {
    try {
      // 允许值是一个函数，用于根据先前的状态计算新状态
      const valueToStore = value instanceof Function ? value(storedValue) : value;
      setStoredValue(valueToStore);
      window.localStorage.setItem(key, JSON.stringify(valueToStore));
    } catch (error) {
      console.error(`Error setting localStorage key "${key}":`, error);
    }
  };

  return [storedValue, setValue];
};