import 'dart:convert';
import 'dart:io';
import 'dart:math';

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

/// 模拟异步获取网络数据（实际应用中会从网络获取真实数据）
Future<String> simulateFetchNetworkData(String url) async {
  print('正在模拟获取网络数据 from: $url');
  
  // 模拟网络延迟
  await Future.delayed(Duration(seconds: 1));
  
  // 返回模拟的网络数据
  var mockData = {
    'url': url,
    'timestamp': DateTime.now().toIso8601String(),
    'data': 'This is simulated network data',
    'status': 'success'
  };
  
  return jsonEncode(mockData);
}

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    // 获取网络数据
    String responseBody = await simulateFetchNetworkData(url);
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String filePath = '/workspace/$randomFileName.dart';
    
    // 将数据写入文件
    File file = File(filePath);
    await file.writeAsString(responseBody);
    
    print('数据已成功保存到: $filePath');
    return filePath;
  } catch (e) {
    print('获取网络数据时出错: $e');
    rethrow;
  }
}

/// 示例使用
void main() async {
  try {
    String url = 'https://example.com/api/data';
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件已保存至: $savedFilePath');
    
    // 验证文件内容
    File savedFile = File(savedFilePath);
    if (await savedFile.exists()) {
      String content = await savedFile.readAsString();
      print('文件内容: $content');
    }
  } catch (e) {
    print('执行过程中出现错误: $e');
  }
}