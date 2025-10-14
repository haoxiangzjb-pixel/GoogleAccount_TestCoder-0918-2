import 'dart:io';
import 'dart:convert';

Future<void> fetchAndSaveData(String url, String fileName) async {
  try {
    print('Fetching data from $url...');
    final response = await HttpClient().getUrl(Uri.parse(url));
    final contents = await response.close();
    final jsonString = await contents.transform(utf8.decoder).join();

    print('Writing data to $fileName...');
    final file = File(fileName);
    await file.writeAsString(jsonString);

    print('Successfully fetched and saved data to $fileName.');
  } catch (e) {
    print('An error occurred: $e');
    rethrow;
  }
}

Future<String> generateRandomFileName() async {
  final random = DateTime.now().millisecondsSinceEpoch;
  return '/workspace/dart_async_project/data_$random.dart';
}

Future<void> main() async {
  const String url = 'https://jsonplaceholder.typicode.com/posts/1';
  final fileName = await generateRandomFileName();
  await fetchAndSaveData(url, fileName);
}
