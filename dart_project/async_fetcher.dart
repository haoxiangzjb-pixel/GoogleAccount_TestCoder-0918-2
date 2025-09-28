import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  final url = Uri.parse('https://httpbin.org/json'); // Example public API
  try {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(url);
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = await response.transform(utf8.decoder).join();
      await saveDataToFile(responseBody);
      print('Data fetched and saved successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    httpClient.close();
  } catch (e) {
    print('An error occurred: $e');
  }
}

Future<void> saveDataToFile(String data) async {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final filename = 'fetched_data_$timestamp.dart';
  final file = File(filename);
  await file.writeAsString(data);
  print('Data saved to $filename');
}