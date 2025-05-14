import 'package:flutter/material.dart';
import 'package:fintech_investor_app/screens/transfer/automation_screen.dart';
import 'package:fintech_investor_app/screens/transfer/deposite_screen.dart';
import 'package:fintech_investor_app/screens/transfer/move_account_screen.dart';
import 'package:fintech_investor_app/screens/transfer/transfer_screen.dart';
import 'package:fintech_investor_app/screens/transfer/wire_funds_screen.dart';
import 'package:fintech_investor_app/screens/transfer/withdraw_screen.dart';

class MoveItem {
  final IconData icon;
  final String title;
  final Widget screen;

  MoveItem({required this.icon, required this.title, required this.screen});
}

class MoveItems {
  static final List<MoveItem> _moveItems = [
    MoveItem(
      icon: Icons.arrow_downward,
      title: 'Deposit',
      screen: DepositScreen(),
    ),
    MoveItem(
      icon: Icons.compare_arrows,
      title: 'Transfer',
      screen: TransferScreen(),
    ),
    MoveItem(
      icon: Icons.arrow_upward,
      title: 'Withdraw',
      screen: WithdrawScreen(),
    ),
    MoveItem(
      icon: Icons.account_balance,
      title: 'Move an account to Wealthsimple',
      screen: MoveAccountScreen(),
    ),
    MoveItem(
      icon: Icons.attach_money,
      title: 'Wire funds',
      screen: WireFundsScreen(),
    ),
    MoveItem(
      icon: Icons.sync,
      title: 'Automations',
      screen: AutomationsScreen(),
    ),
  ];

  static List<MoveItem> get moveItems => List.unmodifiable(_moveItems);
}
