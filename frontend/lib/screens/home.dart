import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary demo values
    int totalAnimals = 8;
    double totalMilk = 45.5;
    double milkRate = 42; // per litre
    double income = totalMilk * milkRate;
    int healthAlerts = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Dairy Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            buildCard("Total Animals", "$totalAnimals", Icons.pets, Colors.green),
            buildCard("Milk Today (L)", "$totalMilk", Icons.water_drop, Colors.blue),
            buildCard("Est. Income (₹)", income.toStringAsFixed(0), Icons.currency_rupee, Colors.orange),
            buildCard("Health Alerts", "$healthAlerts", Icons.warning, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
