import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 模拟从网络获取数据的异步函数
/// 在实际应用中，这里会使用 http 包进行网络请求
Future<Map<String, dynamic>> fetchNetworkData() async {
  // 模拟网络延迟
  await Future.delayed(Duration(seconds: 1));

  // 模拟返回的 JSON 数据
  return {
    'userId': 1,
    'id': 101,
    'title': 'Dart Async Example',
    'completed': false,
  };
}

/// 主函数
Future<void> main() async {
  print('Fetching data...');
  try {
    // 获取数据
    final data = await fetchNetworkData();

    // 生成随机文件名
    var random = Random();
    String randomFileName = 'data_${random.nextInt(10000)}.dart';

    // 将数据写入文件
    File file = File(randomFileName);
    await file.writeAsString('// Generated file: $randomFileName\n\n');
    await file.writeAsString('// Fetched Data:\n', mode: FileMode.append);
    await file.writeAsString(data.toString(), mode: FileMode.append);

    print('Data successfully fetched and saved to $randomFileName');
  } catch (e) {
    print('An error occurred: $e');
  }
}