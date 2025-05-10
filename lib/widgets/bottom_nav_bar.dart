import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    var selectedItemColor = colorScheme.primary;
    var unSelectedItemColor = colorScheme.onSurface.withOpacity(
      0.6,
    ); // muted color

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unSelectedItemColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
        BottomNavigationBarItem(
          icon: Icon(Icons.compare_arrows),
          label: 'Move',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.punch_clock),
          label: 'Activity',
        ),
      ],
    );
  }
}
