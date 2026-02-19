import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketAnalysisScreen extends StatelessWidget {
  const MarketAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Market Analysis")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Milk Price Trend (₹ per Litre)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: true),
                  titlesData: FlTitlesData(show: true),
                  gridData: FlGridData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(1, 32),
                        FlSpot(2, 35),
                        FlSpot(3, 34),
                        FlSpot(4, 38),
                        FlSpot(5, 36),
                        FlSpot(6, 40),
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 4,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Market Insight:\nMilk price increasing steadily 📈",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

