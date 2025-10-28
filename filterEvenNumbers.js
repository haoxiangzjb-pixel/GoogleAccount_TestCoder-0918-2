/**
 * 过滤数组中的偶数
 * @param {number[]} arr - 输入的数字数组
 * @returns {number[]} - 包含偶数的新数组
 */
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

/**
 * 生成随机文件名
 * @returns {string} - 随机文件名
 */
function generateRandomFileName() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < 10; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result + '.json';
}

/**
 * 将过滤后的偶数数组保存到随机命名的文件中
 * @param {number[]} arr - 输入的数字数组
 * @param {string} [outputDir='./'] - 输出目录，默认为当前目录
 * @returns {string} - 保存的文件路径
 */
function saveEvenNumbersToFile(arr, outputDir = './') {
    const evenNumbers = filterEvenNumbers(arr);
    const fileName = generateRandomFileName();
    const filePath = outputDir + fileName;
    
    const fs = require('fs');
    
    // 将偶数数组转换为JSON格式并保存到文件
    fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
    
    console.log(`偶数数组已保存到文件: ${filePath}`);
    console.log(`偶数数组内容:`, evenNumbers);
    
    return filePath;
}

// 示例用法
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
console.log('原始数组:', numbers);

const evenNumbers = filterEvenNumbers(numbers);
console.log('偶数数组:', evenNumbers);

// 保存到随机命名的文件
saveEvenNumbersToFile(numbers);

// 导出函数以供其他模块使用
module.exports = {
    filterEvenNumbers,
    saveEvenNumbersToFile
};