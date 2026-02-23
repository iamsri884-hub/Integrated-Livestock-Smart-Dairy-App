import 'package:flutter/material.dart';

class AnimalDetailScreen extends StatelessWidget {
  final Map<String, dynamic> animal;

  const AnimalDetailScreen({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Type: ${animal['type']}",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Breed: ${animal['breed']}",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Age: ${animal['age']} years",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Milk per day: ${animal['milk']} L",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Estimated Price: ₹${animal['price']}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                const SizedBox(height: 20),
                Text("Health Status: ${animal['health']}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
