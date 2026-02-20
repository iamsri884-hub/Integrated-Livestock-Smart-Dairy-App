import 'package:flutter/material.dart';
import 'home.dart';
import 'livestock.dart';
import 'milk.dart';
import 'products.dart';
import 'profile.dart';
import 'market_analysis.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    LivestockScreen(),
    MilkScreen(),
    ProductsScreen(),
    MarketAnalysisScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets), label: "Livestock"),
          BottomNavigationBarItem(
              icon: Icon(Icons.water_drop), label: "Milk"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: "Market"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
