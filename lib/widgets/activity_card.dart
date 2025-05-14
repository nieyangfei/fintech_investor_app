import 'package:flutter/material.dart';
import 'package:fintech_investor_app/models/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: _getActivityIcon(activity.type),
        title: Text(activity.title),
        subtitle: Text(_formatDate(activity.date)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              activity.amount,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              activity.status,
              style: TextStyle(color: _getOrderColor(activity.status)),
            ),
          ],
        ),
      ),
    );
  }

  MaterialColor _getOrderColor(String status) {
    return status == 'Processing' ? Colors.orange : Colors.green;
  }

  Icon _getActivityIcon(String type) {
    switch (type) {
      case 'Deposit Money':
        return const Icon(Icons.account_balance_wallet, color: Colors.green);
      case 'Transfer Money':
        return const Icon(Icons.compare_arrows, color: Colors.blue);
      case 'Withdraw Money':
        return const Icon(Icons.money_off, color: Colors.red);
      case 'Wire Funds':
        return const Icon(Icons.wifi_tethering, color: Colors.purple);
      case 'Automated Deductions':
        return const Icon(Icons.autorenew, color: Colors.orange);
      default:
        return const Icon(Icons.receipt);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
