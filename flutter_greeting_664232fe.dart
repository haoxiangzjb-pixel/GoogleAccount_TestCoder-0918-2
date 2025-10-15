import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting App'),
      ),
      body: const Center(
        child: Text(
          'Hello! Welcome to Flutter!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Greeting Demo',
      home: const GreetingWidget(),
    ),
  );
}
