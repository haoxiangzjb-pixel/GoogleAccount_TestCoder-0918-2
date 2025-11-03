// 模拟Dart异步函数：获取网络数据并保存到随机命名的.dart文件中
// 使用JavaScript/Node.js实现类似功能

const fs = require('fs').promises;
const https = require('https');
const http = require('http');
const { URL } = require('url');
const path = require('path');

/**
 * 异步函数：获取网络数据并保存到随机命名的.dart文件中
 * @param {string} url - 要获取数据的URL
 * @param {string} [directory] - 保存目录，默认为当前目录
 * @returns {Promise<string>} - 返回保存文件的路径
 */
async function fetchAndSaveData(url, directory = './') {
  return new Promise((resolve, reject) => {
    console.log(`正在从 ${url} 获取数据...`);
    
    const urlObj = new URL(url);
    const client = urlObj.protocol === 'https:' ? https : http;
    
    client.get(url, (response) => {
      let data = '';
      
      response.on('data', (chunk) => {
        data += chunk;
      });
      
      response.on('end', async () => {
        if (response.statusCode === 200) {
          try {
            // 生成随机文件名
            const randomFileName = generateRandomFileName();
            const filePath = path.join(directory, randomFileName);
            
            // 将数据写入文件
            await fs.writeFile(filePath, data);
            
            console.log(`数据已成功保存到: ${filePath}`);
            resolve(filePath);
          } catch (err) {
            reject(err);
          }
        } else {
          reject(new Error(`请求失败，状态码: ${response.statusCode}`));
        }
      });
    }).on('error', (err) => {
      reject(err);
    });
  });
}

/**
 * 生成随机的.dart文件名
 * @returns {string} - 随机生成的.dart文件名
 */
function generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  const nameLength = Math.floor(Math.random() * 5) + 8; // 8-12个字符
  let randomName = '';
  
  for (let i = 0; i < nameLength; i++) {
    randomName += chars[Math.floor(Math.random() * chars.length)];
  }
  
  return `${randomName}.dart`;
}

/**
 * 主函数示例
 */
async function main() {
  // 示例：获取JSONPlaceholder的用户数据
  const url = 'https://jsonplaceholder.typicode.com/users';
  
  try {
    const savedFilePath = await fetchAndSaveData(url);
    console.log('文件保存成功:', savedFilePath);
  } catch (error) {
    console.error('操作失败:', error.message);
  }
}

// 如果直接运行此脚本，则执行主函数
if (require.main === module) {
  main();
}

module.exports = { fetchAndSaveData, generateRandomFileName };