// This file demonstrates a Dart asynchronous function to fetch data from a network API.
// Since the Dart SDK is not installed in the environment, this code cannot be executed here.
// It is provided as an example that you can run in your local Dart environment.

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// Asynchronously fetches data from a given URL and saves it to a randomly named .dart file.
Future<void> fetchAndSaveData(String url) async {
  try {
    print('Fetching data from $url...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data fetched successfully. Saving...');

      // Generate a random filename
      final randomNum = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'random_data_$randomNum.dart';

      // Write the fetched data (as a string representation) to the file
      final file = File(fileName);
      await file.writeAsString('/// Fetched data saved at: ${DateTime.now()}\n\n${data.toString()}');
      print('Data saved to $fileName');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

// Example usage
void main() async {
  await fetchAndSaveData('https://jsonplaceholder.typicode.com/todos/1');
}