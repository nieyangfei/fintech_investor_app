import 'package:flutter/material.dart';

class CustomFormPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String buttonText;

  const CustomFormPage({
    super.key,
    required this.title,
    required this.children,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...children,
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text(buttonText)),
            ),
          ],
        ),
      ),
    );
  }
}
