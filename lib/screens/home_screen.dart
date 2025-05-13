// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:fintech_investor_app/models/accounts.dart';
import 'package:fintech_investor_app/screens/notifications_page.dart';
import 'package:fintech_investor_app/screens/account_screen.dart';
import 'package:fintech_investor_app/models/for_you.dart';
import 'package:fintech_investor_app/models/open_account.dart';

// Home screen has three parts. Encapsulate them to classes for convenience.
// 1. App bar.
// 2. Accounts.
// 3. Advertises.

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final List<Map<String, dynamic>> accounts;
  final Function(String) onAccountOpened;
  final Function(int) onAccountRemoved;

  const HomeScreen({
    super.key,
    required this.accounts,
    required

    this.onAccountOpened,
    required this.onAccountRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Home'),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, NotificationsPage.routeName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, AccountScreen.routeName);
              },
            ),
            // Placeholder: Replace with actual Rewards widget
            const Icon(Icons.star, size: 24),
            // Placeholder: Replace with actual Core widget

          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // — Greeting / Net-worth preview —
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Hello, John!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 4),
                    Text('Net worth: \$1,234,567.89', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Accounts section
            Accounts(
              accounts: accounts,
              onAccountOpened: onAccountOpened,
              onAccountRemoved: onAccountRemoved,
            ),
            const SizedBox(height: 24),
            // Advertises section
            _Advertises(), // Placeholder: Replace with actual Advertises widget
            const SizedBox(height: 24),
            // For You section
            const ForYou(),
          ],
        ),
      ),
    );
  }
}

// Placeholder for Advertises widget
class _Advertises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adapted from teammate's demoAdvertises mapping
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended for You',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: Icon(Icons.info, size: 32, color: Theme.of(context).colorScheme.secondary),
            title: const Text('Placeholder Ad'),
            subtitle: const Text('This is a placeholder advertisement.'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}