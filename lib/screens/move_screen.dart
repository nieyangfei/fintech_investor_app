import 'package:flutter/material.dart';
import 'package:fintech_investor_app/models/move_item.dart';

class MoveScreen extends StatelessWidget {
  final List<MoveItem> moveItems = MoveItems.moveItems;

  MoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Move',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemCount: moveItems.length,
        separatorBuilder:
            (_, __) => Divider(height: 1, color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          final item = moveItems[index];
          return ListTile(
            leading: Icon(
              item.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                ),
          );
        },
      ),
    );
  }
}
