import 'package:flutter/material.dart';

// 🔁 Automations
class AutomationsScreen extends StatelessWidget {
  const AutomationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Automations")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.repeat, color: Colors.blue),
            title: Text("Auto Deposit to Stocks"),
            subtitle: Text("Every 1st of month - \$500"),
          ),
          ListTile(
            leading: Icon(Icons.currency_bitcoin, color: Colors.orange),
            title: Text("Weekly Bitcoin Buy"),
            subtitle: Text("Every Monday - \$100"),
          ),
        ],
      ),
    );
  }
}
