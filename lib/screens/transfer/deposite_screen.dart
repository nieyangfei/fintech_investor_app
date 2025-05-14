// 💸 Deposit Page
import 'package:flutter/material.dart';
import 'package:fintech_investor_app/widgets/custom_form_field.dart';
import 'package:fintech_investor_app/widgets/custom_form_page.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormPage(
      title: "Deposit",
      buttonText: "Confirm Deposit",
      children: [
        CustomFormField(label: "Amount", hint: "\$5000"),
        CustomFormField(label: "From Bank Account", hint: "Chase Bank - 1234"),
      ],
    );
  }
}
