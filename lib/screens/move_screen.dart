import 'package:flutter/material.dart';

class MoveScreen extends StatelessWidget {
  final List<_MoveItem> moveItems = [
    _MoveItem(
      icon: Icons.arrow_downward,
      title: 'Deposit',
      screen: DepositScreen(),
    ),
    _MoveItem(
      icon: Icons.compare_arrows,
      title: 'Transfer',
      screen: TransferScreen(),
    ),
    _MoveItem(
      icon: Icons.arrow_upward,
      title: 'Withdraw',
      screen: WithdrawScreen(),
    ),
    _MoveItem(
      icon: Icons.account_balance,
      title: 'Move an account to Wealthsimple',
      screen: MoveAccountScreen(),
    ),
    _MoveItem(
      icon: Icons.attach_money,
      title: 'Wire funds',
      screen: WireFundsScreen(),
    ),
    _MoveItem(
      icon: Icons.sync,
      title: 'Automations',
      screen: AutomationsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Move',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemCount: moveItems.length,
        separatorBuilder:
            (_, __) => Divider(height: 1, color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          final item = moveItems[index];
          return ListTile(
            leading: Icon(
              item.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                ),
          );
        },
      ),
    );
  }
}

class _MoveItem {
  final IconData icon;
  final String title;
  final Widget screen;
  _MoveItem({required this.icon, required this.title, required this.screen});
}

// 🔁 Reusable Form Field
Widget buildTextField(String label, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

// 💸 Deposit Page
class DepositScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FormPage(
      title: "Deposit",
      children: [
        buildTextField("Amount", "\$5000"),
        buildTextField("From Bank Account", "Chase Bank - 1234"),
      ],
      buttonText: "Confirm Deposit",
    );
  }
}

// 🔄 Transfer Page
class TransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FormPage(
      title: "Transfer",
      children: [
        buildTextField("From Account", "Savings"),
        buildTextField("To Account", "Stock Market"),
        buildTextField("Amount", "\$1500"),
      ],
      buttonText: "Transfer Funds",
    );
  }
}

// ⬆ Withdraw Page
class WithdrawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FormPage(
      title: "Withdraw",
      children: [
        buildTextField("From Account", "Bitcoin Wallet"),
        buildTextField("To Bank", "Wells Fargo - 5678"),
        buildTextField("Amount", "\$2000"),
      ],
      buttonText: "Withdraw Funds",
    );
  }
}

// 🏦 Move Account
class MoveAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _InfoPage(
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

// 🏧 Wire Funds
class WireFundsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FormPage(
      title: "Wire Funds",
      children: [
        buildTextField("Recipient Name", "Jane Doe"),
        buildTextField("Bank Name", "CitiBank"),
        buildTextField("Amount", "\$10,000"),
      ],
      buttonText: "Send Wire",
    );
  }
}

// 🔁 Automations
class AutomationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Automations")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.repeat, color: Colors.blue),
            title: Text("Auto Deposit to Stocks"),
            subtitle: Text("Every 1st of month - \$500"),
          ),
          ListTile(
            leading: Icon(Icons.currency_bitcoin, color: Colors.orange),
            title: Text("Weekly Bitcoin Buy"),
            subtitle: Text("Every Monday - \$100"),
          ),
        ],
      ),
    );
  }
}

// ✅ FormPage Template
class _FormPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String buttonText;

  const _FormPage({
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

// ✅ InfoPage Template
class _InfoPage extends StatelessWidget {
  final String title;
  final List<Widget> content;
  final String buttonText;

  const _InfoPage({
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
