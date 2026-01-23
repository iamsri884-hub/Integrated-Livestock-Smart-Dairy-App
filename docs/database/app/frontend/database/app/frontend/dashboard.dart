import 'package:flutter/material.dart';
import 'livestock.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _card(context, 'Livestock'),
            _card(context, 'Milk Entry'),
            _card(context, 'Sales'),
            _card(context, 'Market Prices'),
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Livestock') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LivestockScreen(),
            ),
          );
        }
      },
      child: Card(
        elevation: 4,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
