// ⬆ Withdraw Page
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/widgets/custom_form_field.dart';
import 'package:fintech_investor_app/widgets/custom_form_page.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormPage(
      title: "Withdraw",
      buttonText: "Withdraw Funds",
      children: [
        CustomFormField(label: "From Account", hint: "Bitcoin Wallet"),
        CustomFormField(label: "To Bank", hint: "Wells Fargo - 5678"),
        CustomFormField(label: "Amount", hint: "\$2000"),
      ],
    );
  }
}
