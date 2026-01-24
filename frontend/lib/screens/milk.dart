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
      builder: (_) => AlertDialog(
        title: const Text('Add Milk Entry'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: cowController,
              decoration: const InputDecoration(labelText: 'Cow ID'),
            ),
            DropdownButtonFormField<String>(
              value: session,
              items: const [
                DropdownMenuItem(value: 'Morning', child: Text('Morning')),
                DropdownMenuItem(value: 'Evening', child: Text('Evening')),
              ],
              onChanged: (value) => session = value!,
              decoration: const InputDecoration(labelText: 'Session'),
            ),
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantity (L)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              addMilk(
                cowController.text,
                session,
                qtyController.text,
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
      appBar: AppBar(title: const Text('Milk Production')),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddMilkDialog,
        child: const Icon(Icons.add),
      ),
      body: m
