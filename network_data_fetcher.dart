import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName.dart';
      
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

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  String randomString = '';
  
  // 生成10位随机字符串
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return 'data_$randomString';
}

/// 主函数 - 演示用法
void main() async {
  // 示例：获取一个公开API的数据
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String savedFilePath = await fetchAndSaveData(apiUrl);
    print('文件保存成功: $savedFilePath');
    
    // 验证文件是否创建成功
    File savedFile = File(savedFilePath);
    if (await savedFile.exists()) {
      print('验证: 文件确实已创建');
      print('文件大小: ${await savedFile.length()} 字节');
    }
  } catch (e) {
    print('程序执行失败: $e');
  }
}