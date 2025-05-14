import 'package:flutter/material.dart';

class OpenAccount extends StatelessWidget {
  const OpenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Text(
        "Open an account",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
