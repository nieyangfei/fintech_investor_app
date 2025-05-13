import 'package:flutter/material.dart';

void main() {
  runApp(MoveApp());
}

class MoveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoveScreen(),
    );
  }
}

class MoveScreen extends StatelessWidget {
  final List<_MoveItem> moveItems = [
    _MoveItem(icon: Icons.arrow_downward, title: 'Deposit', screen: DepositScreen()),
    _MoveItem(icon: Icons.compare_arrows, title: 'Transfer', screen: TransferScreen()),
    _MoveItem(icon: Icons.arrow_upward, title: 'Withdraw', screen: WithdrawScreen()),
    _MoveItem(icon: Icons.account_balance, title: 'Move an account to Wealthsimple', screen: MoveAccountScreen()),
    _MoveItem(icon: Icons.attach_money, title: 'Wire funds', screen: WireFundsScreen()),
    _MoveItem(icon: Icons.sync, title: 'Automations', screen: AutomationsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Move',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemCount: moveItems.length,
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey.shade200),
        itemBuilder: (context, index) {
          final item = moveItems[index];
          return ListTile(
            leading: Icon(item.icon, color: Colors.grey.shade600),
            title: Text(
              item.title,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.screen),
              );
            },
          );
        },
      ),
      // Remove or comment this part:
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 2,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ''),
      //   ],
      // ),
    );
  }
}


class _MoveItem {
  final IconData icon;
  final String title;
  final Widget screen;

  _MoveItem({required this.icon, required this.title, required this.screen});
}

class DepositScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SimpleScreen(title: "Deposit");
  }
}

class TransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SimpleScreen(title: "Transfer");
  }
}

class WithdrawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SimpleScreen(title: "Withdraw");
  }
}

class MoveAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SimpleScreen(title: "Move an account to Wealthsimple");
  }
}

class WireFundsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SimpleScreen(title: "Wire Funds");
  }
}

class AutomationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SimpleScreen(title: "Automations");
  }
}

class _SimpleScreen extends StatelessWidget {
  final String title;

  const _SimpleScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '$title Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
