import 'package:flutter/material.dart';

/// A simple data model for a recommendation card.
class AdvertiseItem {
  final IconData icon;
  final String title;
  final String subtitle;

  AdvertiseItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

/// Sample “Recommended for You” cards
final List<AdvertiseItem> demoAdvertises = [
  AdvertiseItem(
    icon: Icons.trending_up,
    title: 'Invest in Stocks',
    subtitle: 'Start with as little as \$50',
  ),
  AdvertiseItem(
    icon: Icons.pie_chart,
    title: 'Diversify Portfolio',
    subtitle: 'Balance risk and reward',
  ),
  AdvertiseItem(
    icon: Icons.auto_graph,
    title: 'Track Crypto',
    subtitle: 'Stay ahead of the market',
  ),
];
