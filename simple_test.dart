import "dart:convert";
import "dart:io";
import "dart:math";
import "package:http/http.dart" as http;

Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print("正在从 $url 获取数据...");
    
    final response = await http.get(
      Uri.parse(url),
      headers: {"User-Agent": "Dart Network Data Saver 1.0"}
    );
    
    if (response.statusCode == 200) {
      String responseBody = response.body;
      
      String randomFileName = "test_data_${Random().nextInt(10000)}";
      String filePath = "/workspace/$randomFileName.dart";
      
      File file = File(filePath);
      await file.writeAsString(responseBody);
      
      print("数据已成功保存到: $filePath");
      return filePath;
    } else {
      throw Exception("请求失败，状态码: ${response.statusCode}");
    }
  } catch (e) {
    print("获取网络数据时出错: $e");
    rethrow;
  }
}

void main() async {
  try {
    String url = "https://api.github.com/users/octocat";
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print("文件已保存至: $savedFilePath");
  } catch (e) {
    print("执行过程中出现错误: $e");
  }
}