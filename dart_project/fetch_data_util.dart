import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步函数，用于从指定URL获取数据。
/// 成功时返回解析后的JSON数据，失败时返回null。
Future<Map<String, dynamic>?> fetchData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // 如果服务器返回成功状态码，则解析JSON
      return jsonDecode(response.body);
    } else {
      // 如果服务器返回错误状态码，则打印错误信息
      print('请求失败，状态码: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // 捕获并处理网络或其他异常
    print('请求异常: $e');
    return null;
  }
}