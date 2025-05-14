import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final List<Widget> content;
  final String buttonText;

  const InfoPage({
    super.key,
    required this.title,
    required this.content,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...content,
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