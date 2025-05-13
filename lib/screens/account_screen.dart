// lib/screens/account_screen.dart
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/models/accounts.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoAccounts.length,
        itemBuilder: (ctx, i) {
          final acct = demoAccounts[i];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(acct.icon, size: 32, color: Theme.of(ctx).primaryColor),
              title: Text(acct.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              subtitle: Text(acct.subtitle),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                // optionally drill into account details
              },
            ),
          );
        },
      ),
    );
  }
}
