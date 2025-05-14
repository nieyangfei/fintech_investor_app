// 🏦 Move Account
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/widgets/info_page.dart';

class MoveAccountScreen extends StatelessWidget {
  const MoveAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoPage(
      title: "Move Account",
      content: [
        const Text("Transfer your 401(k), TFSA, or RRSP to TradePulse."),
        const SizedBox(height: 12),
        const Text("Processing takes 3–5 business days."),
      ],
      buttonText: "Start Transfer",
    );
  }
}