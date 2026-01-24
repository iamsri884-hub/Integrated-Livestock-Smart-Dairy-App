import 'package:flutter/material.dart';

class LivestockScreen extends StatefulWidget {
  const LivestockScreen({super.key});

  @override
  State<LivestockScreen> createState() => _LivestockScreenState();
}

class _LivestockScreenState extends State<LivestockScreen> {
  final List<Map<String, String>> cows = [];

  void addCow(String id, String health, String age) {
    setState(() {
      cows.add({
        'id': id,
        'health': health,
        'age': age,
      });
    });
  }

  void showAddDialog() {
    final idController = TextEditingController();
    final healthController = TextEditingController();
    final ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Cow'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: idController, decoration: const InputDecoration(labelText: 'Cow ID')),
            TextField(controller: healthController, decoration: const InputDecoration(labelText: 'Health Status')),
            TextField(controller: ageController, decoration: const InputDecoration(labelText: 'Age')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              addCow(
                idController.text,
                healthController.text,
                ageController.text,
              );
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
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
                  child: ListTile(
                    title: Text('Cow ID: ${cow['id']}'),
                    subtitle: Text('Health: ${cow['health']} | Age: ${cow['age']}'),
                  ),
                );
              },
            ),
    );
  }
}
