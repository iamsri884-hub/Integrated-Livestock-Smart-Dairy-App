import 'package:flutter/material.dart';

class LivestockScreen extends StatelessWidget {
  const LivestockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestock'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _cowCard('Cow ID: C001', 'Healthy', 'Age: 3'),
          _cowCard('Cow ID: C002', 'Needs Checkup', 'Age: 5'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // future: add cow form
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _cowCard(String id, String status, String age) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(id),
        subtitle: Text('$status | $age'),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
