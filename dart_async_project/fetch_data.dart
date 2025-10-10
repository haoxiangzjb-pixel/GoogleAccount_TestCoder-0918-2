import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// A simple asynchronous function to fetch data from a URL and save it to a file.
Future<void> fetchAndSaveData(String url, String outputDirectory) async {
  try {
    print('Fetching data from $url...');
    // In a real scenario, you would use an HTTP client like `package:http`.
    // For this example, we'll simulate fetching data.
    // await for (var request in await HttpServer.bind('localhost', 0)) {
    //   var response = await request.close();
    //   var data = await utf8.decoder.bind(response).join();
    //   request.response.close();
    //   return data;
    // }
    // Simulating fetched JSON data
    final jsonData = {
      'message': 'This is simulated data fetched from the network.',
      'timestamp': DateTime.now().toIso8601String(),
      'random_number': Random().nextInt(1000),
    };

    final jsonString = JsonEncoder.withIndent('  ').convert(jsonData);
    print('Data fetched successfully:\n$jsonString');

    // Generate a random filename
    final random = Random();
    String randomFileName = 'network_data_${random.nextInt(10000)}.dart';

    // Define the full path for the output file
    String filePath = '$outputDirectory/$randomFileName';

    // Write the data to the file
    final file = File(filePath);
    await file.writeAsString('/// Data fetched from $url\n\nfinal networkData = $jsonString;\n');
    print('Data saved to $filePath');

  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchAndSaveData('https://api.example.com/data', '/workspace/dart_async_project');
}