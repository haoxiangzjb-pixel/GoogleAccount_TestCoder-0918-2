import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Fetches data from a URL and saves it to a randomly named .dart file.
Future<void> fetchDataAndSave() async {
  final url = Uri.parse('https://httpbin.org/json'); // Example API
  final httpClient = HttpClient();

  try {
    final request = await httpClient.getUrl(url);
    final response = await request.close();

    if (response.statusCode == 200) {
      final jsonString = await response.transform(utf8.decoder).join();
      print('Data fetched successfully:\n$jsonString');

      // Generate a random filename
      final random = Random();
      final randomName = 'random_output_${random.nextInt(10000)}.dart';
      final filePath = '/workspace/dart_async_project/$randomName';

      // Write the data to the file
      final file = File(filePath);
      await file.writeAsString(jsonString);
      print('\nData saved to $filePath');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  } finally {
    httpClient.close();
  }
}

void main() async {
  await fetchDataAndSave();
}