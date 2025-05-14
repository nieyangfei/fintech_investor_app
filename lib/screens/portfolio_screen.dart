import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("My Portfolio"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 💼 Total Net Worth
            Text(
              "\$124,560.32",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text("Total Portfolio Value", style: theme.textTheme.bodyMedium),
            const SizedBox(height: 24),

            // 📊 Pie Chart
            SizedBox(
              height: 180,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      value: 50,
                      color: Colors.blueAccent,
                      title: 'Stocks',
                      radius: 50,
                      titleStyle: const TextStyle(color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: Colors.orangeAccent,
                      title: 'Crypto',
                      radius: 50,
                      titleStyle: const TextStyle(color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 20,
                      color: Colors.green,
                      title: 'Cash',
                      radius: 50,
                      titleStyle: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 📋 Holdings List
            Expanded(
              child: ListView(
                children: const [
                  _HoldingTile(
                    symbol: "AAPL",
                    name: "Apple Inc.",
                    value: "\$45,000",
                    change: "+2.3%",
                    isGain: true,
                  ),
                  _HoldingTile(
                    symbol: "BTC",
                    name: "Bitcoin",
                    value: "\$30,000",
                    change: "-1.4%",
                    isGain: false,
                  ),
                  _HoldingTile(
                    symbol: "ETH",
                    name: "Ethereum",
                    value: "\$20,000",
                    change: "+5.1%",
                    isGain: true,
                  ),
                  _HoldingTile(
                    symbol: "Cash",
                    name: "USD Savings",
                    value: "\$29,560",
                    change: "+0.0%",
                    isGain: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 📋 List Tile for Each Holding
class _HoldingTile extends StatelessWidget {
  final String symbol;
  final String name;
  final String value;
  final String change;
  final bool isGain;

  const _HoldingTile({
    required this.symbol,
    required this.name,
    required this.value,
    required this.change,
    required this.isGain,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        child: Text(
          symbol[0],
          style: TextStyle(color: theme.colorScheme.primary),
        ),
      ),
      title: Text(name, style: theme.textTheme.bodyLarge),
      subtitle: Text(symbol),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            change,
            style: TextStyle(
              color: isGain ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
