import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 导入http包来获取网络数据
    // 注意：在实际使用时，您需要在pubspec.yaml中添加 http: ^0.13.5 依赖
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
  // 注意：实际使用时请替换为有效的URL
  try {
    // 使用示例URL，实际使用时替换为您需要的URL
    String url = 'https://httpbin.org/get?test=data';  // 使用httpbin，更可靠的测试API
    String savedFilePath = await fetchAndSaveNetworkDataWithBuiltInClient(url);
    print('文件已保存至: $savedFilePath');
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}