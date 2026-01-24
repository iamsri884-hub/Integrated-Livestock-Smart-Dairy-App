import 'package:flutter/material.dart';

class MilkScreen extends StatelessWidget {
  const MilkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Milk')),
      body: const Center(child: Text('Milk Screen')),
    );
  }
}
