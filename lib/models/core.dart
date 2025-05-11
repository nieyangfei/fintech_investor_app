import 'package:flutter/material.dart';

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () => print("Core"),
      color: Colors.blue,
    );
  }
}
