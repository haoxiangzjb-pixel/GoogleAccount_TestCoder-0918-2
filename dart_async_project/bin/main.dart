import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<void> fetchAndSaveData() async {
  const String url = 'https://jsonplaceholder.typicode.com/posts/1';
  try {
    print('正在从 $url 获取数据...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('数据获取成功！');
      final data = jsonDecode(response.body);

      // 生成随机文件名
      final randomFileName = 'output_${DateTime.now().millisecondsSinceEpoch}.dart';
      final filePath = 'bin/$randomFileName';

      print('正在将数据写入文件 $filePath ...');
      final file = File(filePath);
      await file.writeAsString('// Generated file: $randomFileName\n\n'
          '/// 数据来自 $url\n'
          'const Map<String, dynamic> fetchedData = ${_formatJsonForCode(data)};\n');

      print('数据已成功保存到 $filePath');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

/// 辅助函数：将JSON对象格式化为Dart代码字符串
String _formatJsonForCode(dynamic obj) {
  if (obj is Map) {
    final entries = obj.entries.map((e) => "'${e.key}': ${_formatJsonForCode(e.value)}").join(', ');
    return '{ $entries }';
  } else if (obj is List) {
    final items = obj.map(_formatJsonForCode).join(', ');
    return '[ $items ]';
  } else if (obj is String) {
    return "'$obj'";
  } else {
    return obj.toString();
  }
}

void main() async {
  await fetchAndSaveData();
}