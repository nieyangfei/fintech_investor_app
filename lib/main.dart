// lib/main.dart
import 'package:flutter/material.dart';

// Screens
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/move_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/notifications_page.dart';
import 'screens/account_screen.dart';

// Widgets
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Investor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Named routes for direct navigation
      home: const MainWrapper(),
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0; // Start with Home tab

  // Initial accounts list
  List<Map<String, dynamic>> accounts = [
    {
      "title": "Savings",
      "subtitle": "Balance: \$12345.00",
      "icon": Icons.savings,
      "color": const Color(0xFFE5A4A7),
    },
    {
      "title": "Bitcoin",
      "subtitle": "Hold: 1.35 bitcoins, value: \$9564.56",
      "icon": Icons.currency_bitcoin,
      "color": Colors.yellow,
    },
    {
      "title": "Stock Market",
      "subtitle": "Value: \$954564.56",
      "icon": Icons.show_chart,
      "color": Colors.green,
    },
  ];

  // Add a new account
  void _addAccount(String accountType) {
    if (!accounts.any((account) => account["title"] == accountType)) {
      setState(() {
        if (accountType == "Chequing") {
          accounts.add({
            "title": "Chequing",
            "subtitle": "Balance: \$0.00",
            "icon": Icons.account_balance,
            "color": Colors.orange,
          });
        } else if (accountType == "TFSA") {
          accounts.add({
            "title": "TFSA",
            "subtitle": "Balance: \$0.00",
            "icon": Icons.account_balance_wallet,
            "color": Colors.yellow,
          });
        } else if (accountType == "USD Savings") {
          accounts.add({
            "title": "USD Savings",
            "subtitle": "Balance: \$0.00",
            "icon": Icons.account_balance,
            "color": Colors.blue,
          });
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$accountType account opened!")),
      );
    }
  }

  // Remove an account
  void _removeAccount(int index) {
    setState(() {
      final account = accounts[index];
      accounts.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${account["title"]} account removed!")),
      );
    });
  }

  // The four main tabs
  static final List<Widget> _screens = [
    HomeScreen(
      accounts: [], // Will be overridden in build
      onAccountOpened: (String type) {}, // Will be overridden
      onAccountRemoved: (int index) {}, // Will be overridden
    ),
    const DiscoverScreen(),
    MoveScreen(),
    const ActivityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Update HomeScreen with account data and functions
    _screens[0] = HomeScreen(
      accounts: accounts,
      onAccountOpened: _addAccount,
      onAccountRemoved: _removeAccount,
    );

    return MaterialApp(
      title: 'Flutter Investor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        NotificationsPage.routeName: (_) => const NotificationsPage(),
        AccountScreen.routeName: (_) => AccountScreen(accounts: accounts),
      },
      home: Scaffold(
        // Show the selected tab
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}