// lib/screens/account_screen.dart
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account';
  final List<Map<String, dynamic>> accounts;

  const AccountScreen({super.key, required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        itemBuilder: (ctx, i) {
          final acct = accounts[i];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(acct['icon'], size: 32, color: Theme.of(ctx).colorScheme.primary),
              title: Text(acct['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              subtitle: Text(acct['subtitle']),
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