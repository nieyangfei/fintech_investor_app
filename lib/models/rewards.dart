import 'package:flutter/material.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.card_giftcard),
      onPressed: () => print("Rewards"),
      color: Colors.purple,
    );
  }
}
