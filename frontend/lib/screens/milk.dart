import 'package:flutter/material.dart';

class MilkScreen extends StatefulWidget {
  const MilkScreen({super.key});

  @override
  State<MilkScreen> createState() => _MilkScreenState();
}

class _MilkScreenState extends State<MilkScreen> {
  final List<Map<String, String>> milkEntries = [];

  void addMilk(String cowId, String session, String quantity) {
    setState(() {
      milkEntries.add({
        'cowId': cowId,
        'session': session,
        'quantity': quantity,
      });
    });
  }

  void showAddMilkDialog() {
    final cowController = TextEditingController();
    final qtyController = TextEditingController();
    String session = 'Morning';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Milk Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cowController,
                decoration:
                    const InputDecoration(labelText: 'Cow ID'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: session,
                items: const [
                  DropdownMenuItem(
                      value: 'Morning',
                      child: Text('Morning')),
                  DropdownMenuItem(
                      value: 'Evening',
                      child: Text('Evening')),
                ],
                onChanged: (value) {
                  session = value!;
                },
                decoration:
                    const InputDecoration(labelText: 'Session'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: qtyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Quantity (L)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (cowController.text.isNotEmpty &&
                    qtyController.text.isNotEmpty) {
                  addMilk(
                    cowController.text,
                    session,
                    qtyController.text,
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Milk')),
      body: milkEntries.isEmpty
          ? const Center(
              child: Text('No milk entries added'),
            )
          : ListView.builder(
              itemCount: milkEntries.length,
              itemBuilder: (context, index) {
                final entry = milkEntries[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading:
                        const Icon(Icons.water_drop),
                    title:
                        Text("Cow: ${entry['cowId']}"),
                    subtitle: Text(
                        "${entry['session']} - ${entry['quantity']} L"),
                  ),
                );
              },
            ),
      floatingActionButton:
          FloatingActionButton(
        onPressed: showAddMilkDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
