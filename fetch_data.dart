import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchAndSaveData() async {
  try {
    // Fetch data from a public API
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = json.decode(response.body);

      // Generate a random filename
      final random = DateTime.now().millisecondsSinceEpoch;
      final filename = 'data_$random.dart';

      // Format the data as a Dart constant map
      final fileContent = '''
// Data fetched from API
const Map<String, dynamic> apiData = $data;
''';

      // Write the data to the file
      final file = File(filename);
      await file.writeAsString(fileContent);

      print('Data successfully fetched and saved to $filename');
    } else {
      print('Failed to get data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchAndSaveData();
}