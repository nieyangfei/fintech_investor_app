import 'package:flutter/material.dart';
import 'package:fintech_investor_app/models/accounts.dart';
import 'package:fintech_investor_app/models/advertises.dart';
import 'package:fintech_investor_app/screens/notifications_page.dart';
import 'package:fintech_investor_app/screens/account_screen.dart';
import 'package:fintech_investor_app/models/for_you.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, NotificationsPage.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              final confirmed = await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn');

                if (!context.mounted) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, AccountScreen.routeName);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // — Greeting / Net-worth preview —
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                child: Text(
                  'JW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello, John Wick!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Net worth: \$1,234,567.89',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text('Your Accounts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // — Accounts list —
          ...demoAccounts.map((acct) => Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(acct.icon, size: 32, color: Theme.of(context).primaryColor),
              title: Text(acct.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(acct.subtitle),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                // optional: deep-link into each account
              },
            ),
          )),

          const SizedBox(height: 24),
          const Text('Recommended for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // — Recommendation cards —
          ...demoAdvertises.map((ad) => Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(ad.icon, size: 32, color: Theme.of(context).colorScheme.secondary),
              title: Text(ad.title),
              subtitle: Text(ad.subtitle),
              onTap: () {
                // navigate to more details
              },
            ),
          )),

          const ForYou(),
        ],
      ),
    );
  }
}
