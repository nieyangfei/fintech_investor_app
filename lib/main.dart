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
      routes: {
        NotificationsPage.routeName: (_) => const NotificationsPage(),
        AccountScreen.routeName:     (_) => const AccountScreen(),
      },
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

  // The four main tabs
  static final List<Widget> _screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    MoveScreen(),
    const ActivityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the selected tab
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
