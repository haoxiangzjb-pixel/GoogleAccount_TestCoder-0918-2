import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步函数，用于从指定URL获取数据。
/// 返回解析后的JSON数据或在出错时返回null。
Future<Map<String, dynamic>?> fetchData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // 如果服务器返回 200 OK，则解析JSON
      return json.decode(response.body);
    } else {
      // 如果服务器返回非200状态码，则抛出异常
      throw Exception('Failed to load data with status code: ${response.statusCode}');
    }
  } catch (e) {
    // 捕获并打印任何网络或解析错误
    print('Error fetching data: $e');
    return null;
  }
}

// 示例主函数，演示如何使用 fetchData
void main() async {
  String url = 'https://api.github.com/repos/dart-lang/sdk/commits';
  Map<String, dynamic>? data = await fetchData(url);

  if (data != null) {
    print('Successfully fetched data:');
    print(data);
  } else {
    print('Failed to fetch data.');
  }
}