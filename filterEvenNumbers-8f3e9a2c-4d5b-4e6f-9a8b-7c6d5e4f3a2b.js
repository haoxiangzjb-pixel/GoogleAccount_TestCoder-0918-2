/**
 * 过滤数组中的偶数
 * @param {number[]} arr - 输入的数字数组
 * @returns {number[]} 只包含偶数的新数组
 */
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// 示例用法
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log('原始数组:', numbers);
console.log('偶数数组:', evenNumbers);

// 导出函数以便在其他文件中使用
module.exports = filterEvenNumbers;