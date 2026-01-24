import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Map<String, String>> products = [];

  void addProduct(String name, String qty, String price) {
    setState(() {
      products.add({
        'name': name,
        'qty': qty,
        'price': price,
      });
    });
  }

  void showAddProductDialog() {
    final nameController = TextEditingController();
    final qtyController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Product name'),
            ),
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantity'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
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
              addProduct(
                nameController.text,
                qtyController.text,
                priceController.text,
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
      appBar: AppBar(title: const Text('Dairy Products')),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddProductDialog,
        child: const Icon(Icons.add),
      ),
      body: products.isEmpty
          ? const Center(child: Text('No products added'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return Card(
                  child: ListTile(
                    title: Text(p['name']!),
                    subtitle: Text(
                      'Qty: ${p['qty']} | ₹${p['price']}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}

