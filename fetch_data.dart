import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchDataAndSave() async {
  try {
    // Fetch data from a public API
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Generate a random filename
      final randomNum = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'data_$randomNum.dart';

      // Create the content for the new file
      final fileContent = '''
// This file was auto-generated on ${DateTime.now()}.
// Fetched data from https://jsonplaceholder.typicode.com/todos/1
const Map<String, dynamic> fetchedData = $data;
''';

      // Write the data to the new file
      final file = File(fileName);
      await file.writeAsString(fileContent);

      print('Data successfully fetched and saved to \$fileName');
    } else {
      print('Failed to load data. Status code: \${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: \$e');
  }
}

void main() async {
  await fetchDataAndSave();
}