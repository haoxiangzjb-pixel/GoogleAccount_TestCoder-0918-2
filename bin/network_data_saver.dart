import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

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

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在获取网络数据 from: $url');
    
    // 发送HTTP请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 读取响应数据
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

/// 示例使用
void main() async {
  try {
    // 使用一个简单的测试URL
    String url = 'https://httpbin.org/json';
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件已保存至: $savedFilePath');
    
    // 验证文件内容
    File savedFile = File(savedFilePath);
    if (await savedFile.exists()) {
      String content = await savedFile.readAsString();
      print('文件内容预览 (前200个字符): ${content.length > 200 ? content.substring(0, 200) + "..." : content}');
    }
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}