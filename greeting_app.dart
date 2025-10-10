import 'package:flutter/material.dart';

void main() {
  runApp(const GreetingApp());
}

class GreetingApp extends StatelessWidget {
  const GreetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GreetingScreen(),
    );
  }
}

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting App'),
      ),
      body: const Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}