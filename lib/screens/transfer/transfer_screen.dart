// 🔄 Transfer Page
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/widgets/custom_form_field.dart';
import 'package:fintech_investor_app/widgets/custom_form_page.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormPage(
      title: "Transfer",
      buttonText: "Transfer Funds",
      children: [
        CustomFormField(label: "From Account", hint: "Savings"),
        CustomFormField(label: "To Account", hint: "Stock Market"),
        CustomFormField(label: "Amount", hint: "\$1500"),
      ],
    );
  }
}
