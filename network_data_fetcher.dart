import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url, {String? directory}) async {
  try {
    // 使用http包获取网络数据
    http.Response response = await http.get(Uri.parse(url));
    
    // 检查响应是否成功
    if (response.statusCode != 200) {
      throw Exception('获取网络数据失败，状态码: ${response.statusCode}');
    }
    
    String responseBody = response.body;
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 确定保存目录
    String saveDirectory = directory ?? '/workspace';
    if (!Directory(saveDirectory).existsSync()) {
      Directory(saveDirectory).createSync(recursive: true);
    }
    
    // 创建完整文件路径
    String filePath = '$saveDirectory/$randomFileName.dart';
    
    // 将网络数据写入文件
    File file = File(filePath);
    await file.writeAsString(responseBody);
    
    print('网络数据已成功保存到: $filePath');
    return filePath;
  } catch (e) {
    print('获取或保存网络数据时发生错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return buffer.toString();
}

/// 使用示例
Future<void> main() async {
  try {
    // 示例：获取JSONPlaceholder API的数据
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String savedFilePath = await fetchAndSaveNetworkData(url, directory: '/workspace');
    print('文件已保存至: $savedFilePath');
  } catch (e) {
    print('主函数执行出错: $e');
  }
}