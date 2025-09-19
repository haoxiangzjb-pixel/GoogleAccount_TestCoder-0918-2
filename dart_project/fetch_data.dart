import 'dart:io';
import 'dart:convert';
import 'dart:math';

/// Generates a random string of the specified [length].
String _generateRandomString(int length) {
  final random = Random();
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(length, (index) => characters[random.nextInt(characters.length)]).join();
}

/// Fetches data from a URL and saves it to a file with a random name.
Future<void> fetchAndSaveData() async {
  final String randomFileName = 'data_${_generateRandomString(8)}.dart';
  final String filePath = '/workspace/dart_project/$randomFileName';

  try {
    // 1. Create an HTTP client.
    final HttpClient client = HttpClient();

    // 2. Prepare the request URI.
    final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    // 3. Open the HTTP connection and send the request.
    final HttpClientRequest request = await client.getUrl(url);
    final HttpClientResponse response = await request.close();

    // 4. Check if the request was successful.
    if (response.statusCode == HttpStatus.ok) {
      // 5. Read the response body as a string.
      final String responseBody = await response.transform(utf8.decoder).join();

      // 6. Write the data to a file.
      await File(filePath).writeAsString('''
// Data fetched from $url
final Map<String, dynamic> fetchedData = ${responseBody};
''');

      print('Data successfully fetched and saved to $filePath');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error occurred: $e');
  } on FileSystemException catch (e) {
    print('File system error occurred: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  } finally {
    // Ensure the client is closed to free up resources.
    client.close();
  }
}

void main() async {
  await fetchAndSaveData();
}