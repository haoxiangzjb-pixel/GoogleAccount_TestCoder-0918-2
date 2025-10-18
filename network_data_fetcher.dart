import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 发送HTTP GET请求
    http.Response response = await http.get(Uri.parse(url));
    
    // 检查响应状态
    if (response.statusCode != 200) {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
    
    // 获取响应内容
    String responseBody = response.body;
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String filePath = '/workspace/$randomFileName.dart';
    
    // 将数据保存到文件
    File file = File(filePath);
    await file.writeAsString(responseBody);
    
    print('数据已保存到: $filePath');
    return filePath;
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  var random = Random();
  String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  StringBuffer sb = StringBuffer();
  
  // 生成8个字符的随机名称
  for (int i = 0; i < 8; i++) {
    sb.write(chars[random.nextInt(chars.length)]);
  }
  
  return sb.toString();
}

// 使用示例
void main() async {
  try {
    // 示例：获取JSONPlaceholder API的数据
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件保存成功: $savedFilePath');
  } catch (e) {
    print('执行失败: $e');
  }
}