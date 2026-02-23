import 'package:flutter/material.dart';
import 'animal_detail.dart';

class LivestockScreen extends StatefulWidget {
  const LivestockScreen({super.key});

  @override
  State<LivestockScreen> createState() => _LivestockScreenState();
}

class _LivestockScreenState extends State<LivestockScreen> {
  final List<Map<String, dynamic>> animals = [];

  void addAnimal(String type, String breed, int age, String health, double milk) {
    double price = (milk * 3000) - (age * 2000);

    setState(() {
      animals.add({
        'type': type,
        'breed': breed,
        'age': age,
        'health': health,
        'milk': milk,
        'price': price,
        'status': 'Available',
      });
    });
  }

  Color getHealthColor(String health) {
    switch (health) {
      case "Healthy":
        return Colors.green;
      case "Moderate":
        return Colors.orange;
      case "Sick":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color getStatusColor(String status) {
    return status == "Available" ? Colors.blue : Colors.grey;
  }

  void showAddDialog() {
    final typeController = TextEditingController();
    final breedController = TextEditingController();
    final ageController = TextEditingController();
    final milkController = TextEditingController();

    String healthValue = "Healthy";

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Livestock"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: typeController,
                decoration: const InputDecoration(labelText: "Animal Type"),
              ),
              TextField(
                controller: breedController,
                decoration: const InputDecoration(labelText: "Breed"),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Age"),
              ),
              TextField(
                controller: milkController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Milk per day (litre)"),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: healthValue,
                items: const [
                  DropdownMenuItem(value: "Healthy", child: Text("Healthy")),
                  DropdownMenuItem(value: "Moderate", child: Text("Moderate")),
                  DropdownMenuItem(value: "Sick", child: Text("Sick")),
                ],
                onChanged: (value) {
                  healthValue = value!;
                },
                decoration: const InputDecoration(labelText: "Health Status"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              addAnimal(
                typeController.text,
                breedController.text,
                int.parse(ageController.text),
                healthValue,
                double.parse(milkController.text),
              );
              Navigator.pop(context);
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }

  void sellAnimal(int index) {
    setState(() {
      animals[index]['status'] = "Sold";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Livestock Marketplace")),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: animals.isEmpty
          ? const Center(child: Text("No livestock added"))
          : ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                final animal = animals[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AnimalDetailScreen(animal: animal),
                        ),
                      );
                    },
                    leading: Icon(Icons.pets,
                        color: getHealthColor(animal['health'])),
                    title: Text("${animal['type']} - ${animal['breed']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Age: ${animal['age']} yrs | Milk: ${animal['milk']} L"),
                        Text(
                            "Price: ₹${animal['price'].toStringAsFixed(0)}"),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: getStatusColor(animal['status']),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            animal['status'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    trailing: animal['status'] == "Available"
                        ? ElevatedButton(
                            onPressed: () => sellAnimal(index),
                            child: const Text("Sell"),
                          )
                        : const Text("Sold",
                            style: TextStyle(color: Colors.grey)),
                  ),
                );
              },
            ),
    );
  }
}
