import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
/// 使用http包实现
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 使用http包获取网络数据，添加User-Agent头
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'Dart Network Data Saver 1.0'}
    );
    
    if (response.statusCode == 200) {
      // 获取响应体
      String responseBody = response.body;
      
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName.dart';
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(responseBody);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('获取网络数据时出错: $e');
    rethrow;
  }
}

/// 使用dart:io的HttpClient获取网络数据并保存到随机命名的.dart文件中
/// 这个版本不依赖外部包，使用Dart内置的HttpClient
Future<String> fetchAndSaveNetworkDataWithBuiltInClient(String url) async {
  try {
    print('正在从 $url 获取数据 (使用内置HttpClient)...');
    
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    
    if (response.statusCode == 200) {
      // 读取响应数据
      var responseBody = await response.transform(utf8.decoder).join();
      
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName.dart';
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(responseBody);
      
      print('数据已成功保存到: $filePath');
      httpClient.close();
      return filePath;
    } else {
      httpClient.close();
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('获取网络数据时出错: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  var random = Random();
  var stringBuffer = StringBuffer();
  
  // 生成8位随机字母数字字符串
  for (int i = 0; i < 8; i++) {
    int randomInt = random.nextInt(36); // 0-9, a-z 共36个字符
    if (randomInt < 10) {
      stringBuffer.write(randomInt); // 0-9
    } else {
      stringBuffer.write(String.fromCharCode(97 + randomInt - 10)); // a-z
    }
  }
  
  return 'data_${stringBuffer.toString()}';
}

/// 示例使用
void main() async {
  // 示例：获取一个公开API的数据并保存
  try {
    // 使用JSONPlaceholder API作为示例
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件已保存至: $savedFilePath');
    
    // 也可以尝试使用内置HttpClient
    String url2 = 'https://jsonplaceholder.typicode.com/users/1';
    String savedFilePath2 = await fetchAndSaveNetworkDataWithBuiltInClient(url2);
    print('第二个文件已保存至: $savedFilePath2');
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}