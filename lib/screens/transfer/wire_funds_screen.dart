// 🏧 Wire Funds
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/widgets/custom_form_field.dart';
import 'package:fintech_investor_app/widgets/custom_form_page.dart';

class WireFundsScreen extends StatelessWidget {
  const WireFundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormPage(
      title: "Wire Funds",
      buttonText: "Send Wire",
      children: [
        CustomFormField(label: "Recipient Name", hint: "Jane Doe"),
        CustomFormField(label: "Bank Name", hint: "CitiBank"),
        CustomFormField(label: "Amount", hint: "\$10,000"),
      ],
    );
  }
}
