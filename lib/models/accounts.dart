// lib/models/accounts.dart
import 'package:fintech_investor_app/models/open_account.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  final List<Map<String, dynamic>> accounts;
  final Function(String) onAccountOpened;
  final Function(int) onAccountRemoved;

  const Accounts({
    super.key,
    required this.accounts,
    required this.onAccountOpened,
    required this.onAccountRemoved,
  });

  @override
  State<Accounts> createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Your Accounts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...widget.accounts.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> account = entry.value;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(account["icon"], color: account["color"]),
              title: Text(account["title"], style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(account["subtitle"]),
              trailing: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (String value) {
                  if (value == 'remove') {
                    widget.onAccountRemoved(index);
                    // SnackBar handled in main.dart
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'remove',
                    child: Text('Remove'),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        }).toList(),
        OpenAccount(onAccountOpened: widget.onAccountOpened),
      ],
    );
  }
}