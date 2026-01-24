import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dairy App',
      home: const Scaffold(
        body: Center(child: Text('Smart Dairy App')),
      ),
    );
  }
}
