import 'package:flutter/material.dart';
import 'livestock.dart';
import 'milk.dart';
import 'products.dart';
import 'profile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _card(context, 'Livestock', const LivestockScreen()),
          _card(context, 'Milk', const MilkScreen()),
          _card(context, 'Products', const ProductsScreen()),
          _card(context, 'Profile', const ProfileScreen()),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Card(
        elevation: 3,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
