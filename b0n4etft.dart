import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
      ),
      body: Center(
        child: Text(
          'Hello! Welcome to Flutter!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// If you want to run this as a standalone app, uncomment the code below:
/*
void main() {
  runApp(
    MaterialApp(
      home: GreetingWidget(),
    ),
  );
}
*/