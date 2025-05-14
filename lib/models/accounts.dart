import 'package:flutter/material.dart';

/// A simple data model for an account card.
class AccountItem {
  final IconData icon;
  final String title;
  final String subtitle;

  AccountItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

/// Sample accounts to show on HomeScreen
final List<AccountItem> demoAccounts = [
  AccountItem(
    icon: Icons.savings,
    title: 'Savings',
    subtitle: 'Balance: \$12,345.00',
  ),
  AccountItem(
    icon: Icons.currency_bitcoin,
    title: 'Bitcoin',
    subtitle: 'Hold: 1.35 BTC (\$9,564.56)',
  ),
  AccountItem(
    icon: Icons.show_chart,
    title: 'Stock Market',
    subtitle: 'Value: \$8,000.50',
  ),
];
