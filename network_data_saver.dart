import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 异步获取网络数据并保存到随机命名的.dart文件中
/// [url] - 要获取数据的网络URL
/// 返回生成的文件名
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 创建HttpClient实例
    HttpClient client = HttpClient();
    
    // 设置请求超时时间
    client.connectionTimeout = Duration(seconds: 10);
    
    // 发起GET请求
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    
    // 检查响应状态
    if (response.statusCode != 200) {
      client.close();
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
    
    // 读取响应数据
    String responseBody = await response.transform(utf8.decoder).join();
    client.close();
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 将数据写入随机命名的.dart文件
    File file = File(randomFileName);
    await file.writeAsString(responseBody);
    
    print('数据已保存到: $randomFileName');
    return randomFileName;
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成10个字符的随机文件名
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  // 确保文件名以.dart结尾
  return '${randomString}.dart';
}

/// 示例用法
void main() async {
  // 示例：获取一个公共API的数据
  String url = 'https://httpbin.org/get?test=data';
  
  try {
    String fileName = await fetchAndSaveNetworkData(url);
    print('成功保存数据到文件: $fileName');
  } catch (e) {
    print('操作失败: $e');
  }
}