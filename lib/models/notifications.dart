import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: const Icon(Icons.doorbell), onPressed: () => print("Notification"), color: Colors.green,);
  }
}
