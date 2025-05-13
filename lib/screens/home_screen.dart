import 'package:fintech_investor_app/models/accounts.dart';
import 'package:fintech_investor_app/models/advertises.dart';
import 'package:fintech_investor_app/models/core.dart';
import 'package:fintech_investor_app/models/for_you.dart';
import 'package:fintech_investor_app/models/notifications.dart';
import 'package:fintech_investor_app/models/rewards.dart';
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/screens/notifications_page.dart';

// Home screen has three parts. Encapsulate them to classes for convenience.
// 1. App bar.
// 2. Accounts.
// 3. Advertises.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Home'),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationsPage()),
                );
              },
            ),
            Rewards(),
            Core(),
          ],
        ),
      ),
      body: Column(
        // Accounts & Advertises.
        children: [Accounts(), Advertises(), const ForYou()],
      ),
    );
  }
}
