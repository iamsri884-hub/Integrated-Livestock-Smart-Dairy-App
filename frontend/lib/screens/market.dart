import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Market Analysis")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text("Milk Price Today"),
                subtitle: const Text("₹42 per litre"),
                trailing: const Icon(Icons.trending_up, color: Colors.green),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                title: const Text("Cow Market Rate"),
                subtitle: const Text("₹55,000 - ₹80,000"),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                title: const Text("Buffalo Market Rate"),
                subtitle: const Text("₹65,000 - ₹1,00,000"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
