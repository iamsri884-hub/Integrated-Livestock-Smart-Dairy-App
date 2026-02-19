import 'package:flutter/material.dart';
import 'livestock.dart';
import 'milk.dart';
import 'products.dart';
import 'profile.dart';
import 'market.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final screens = [
    LivestockScreen(),
    MilkScreen(),
    ProductsScreen(),
    MarketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pets), label: "Livestock"),
          BottomNavigationBarItem(
              icon: Icon(Icons.water_drop), label: "Milk"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: "Market"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
