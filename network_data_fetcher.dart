import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 创建带请求头的请求
    final request = http.Request('GET', Uri.parse(url));
    request.headers['User-Agent'] = 'Dart Network Data Fetcher';
    request.headers['Accept'] = 'application/json, text/plain, */*';
    
    // 发起网络请求
    final response = await http.Client().send(request);
    final responseBody = await response.stream.bytesToString();
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName';
      
      // 将数据写入文件
      await File(filePath).writeAsString(responseBody);
      
      print('数据已保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = '';
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return '${randomString}.dart';
}

void main() async {
  // 示例：获取GitHub的公共事件数据
  String url = 'https://api.github.com/events';
  
  try {
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('成功获取并保存数据到文件: $savedFilePath');
  } catch (e) {
    print('执行失败: $e');
  }
}