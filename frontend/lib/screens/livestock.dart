import 'package:flutter/material.dart';

class LivestockScreen extends StatefulWidget {
  const LivestockScreen({super.key});

  @override
  State<LivestockScreen> createState() => _LivestockScreenState();
}

class _LivestockScreenState extends State<LivestockScreen> {
  final List<Map<String, dynamic>> cows = [];

  void addCow(String id, String health, String age, String price) {
    setState(() {
      cows.add({
        'id': id,
        'health': health,
        'age': age,
        'price': price,
        'rating': 4.0,
      });
    });
  }

  void showAddDialog() {
    final idController = TextEditingController();
    final healthController = TextEditingController();
    final ageController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Cow'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'Cow ID'),
              ),
              TextField(
                controller: healthController,
                decoration: const InputDecoration(labelText: 'Health Status'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price (₹)'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (idController.text.isNotEmpty &&
                  priceController.text.isNotEmpty) {
                addCow(
                  idController.text,
                  healthController.text,
                  ageController.text,
                  priceController.text,
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void buyCow(String id) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Cow $id Purchased Successfully 🐄")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Livestock')),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: cows.isEmpty
          ? const Center(child: Text('No livestock added'))
          : ListView.builder(
              itemCount: cows.length,
              itemBuilder: (context, index) {
                final cow = cows[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(Icons.pets, color: Colors.green),
                    title: Text('Cow ID: ${cow['id']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Health: ${cow['health']}'),
                        Text('Age: ${cow['age']} years'),
                        Text('Price: ₹${cow['price']}'),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 18),
                            Text('${cow['rating']}'),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => buyCow(cow['id']),
                          child: const Text("Buy"),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              cows.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
