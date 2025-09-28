import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// A simple function to simulate fetching data asynchronously.
/// In a real-world scenario, you would use `package:http` or similar.
Future<Map<String, dynamic>> fetchData() async {
  // Simulate network delay
  await Future.delayed(const Duration(seconds: 1));

  // Simulate fetched data
  return {
    'title': 'Sample Data from Network',
    'id': 101,
    'timestamp': DateTime.now().toIso8601String(),
    'items': [
      {'name': 'Item A', 'value': 10},
      {'name': 'Item B', 'value': 20},
    ]
  };
}

/// Generates a random string of specified length.
String generateRandomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random.secure();
  final codeUnits = List.generate(length, (index) => chars.codeUnitAt(random.nextInt(chars.length)));
  return String.fromCharCodes(codeUnits);
}

void main() async {
  print('Fetching data...');
  try {
    final data = await fetchData();
    print('Data fetched successfully: $data');

    // Generate a random filename
    final randomFileName = generateRandomString(10) + '.dart';
    final filePath = '/workspace/dart_async/$randomFileName';

    print('Saving data to $randomFileName...');

    // Convert data to a simple Dart map literal string for the file content
    final fileContent = '''
// Auto-generated file: $randomFileName
// Fetched on: ${DateTime.now().toIso8601String()}

const fetchedData = ${jsonEncode(data)};
''';

    final file = File(filePath);
    await file.writeAsString(fileContent);

    print('Data saved successfully to $filePath');
  } catch (e) {
    print('An error occurred: $e');
  }
}