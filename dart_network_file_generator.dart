import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveData(String url, {String? directory}) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = directory != null 
          ? '$directory/$randomFileName' 
          : randomFileName;
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(response.body);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机的.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成8-12个字符的随机名称
  int nameLength = random.nextInt(5) + 8; // 8-12个字符
  String randomName = '';
  
  for (int i = 0; i < nameLength; i++) {
    randomName += chars[random.nextInt(chars.length)];
  }
  
  return '${randomName}.dart';
}

/// 主函数示例
void main() async {
  // 示例：获取JSONPlaceholder的用户数据
  String url = 'https://jsonplaceholder.typicode.com/users';
  
  try {
    String savedFilePath = await fetchAndSaveData(url);
    print('文件保存成功: $savedFilePath');
  } catch (e) {
    print('操作失败: $e');
  }
  
  // 您也可以指定保存目录
  // String savedFilePath = await fetchAndSaveData(url, directory: '/workspace/output');
}