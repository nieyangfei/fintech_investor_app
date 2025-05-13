// lib/models/open_account.dart
import 'package:flutter/material.dart';

class OpenAccount extends StatelessWidget {
  final Function(String) onAccountOpened;

  const OpenAccount({super.key, required this.onAccountOpened});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OpenAccountSelectionPage(onAccountOpened: onAccountOpened)),
          );
        },
        child: const Text(
          "Open an account",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OpenAccountSelectionPage extends StatelessWidget {
  final Function(String) onAccountOpened;

  const OpenAccountSelectionPage({super.key, required this.onAccountOpened});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open a new account"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Which account would you like to open?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildAccountOption(
              context,
              title: "Chequing",
              subtitle: "Earn high interest on your cash. No monthly fees.",
              interest: "Earns 1.75% interest",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChequingPage(onAccountOpened: onAccountOpened)),
                );
              },
            ),
            _buildAccountOption(
              context,
              title: "USD Savings",
              subtitle: "Save and earn 3% interest in U.S. dollars.",
              interest: "Earns 3% interest",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => USDSavingsPage(onAccountOpened: onAccountOpened)),
                );
              },
            ),
            _buildAccountOption(
              context,
              title: "TFSA",
              subtitle: "Save for any goal. Earnings are tax-free.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TFSAPage(onAccountOpened: onAccountOpened)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption(BuildContext context, {required String title, required String subtitle, String? interest, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (interest != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(interest, style: const TextStyle(fontSize: 12, color: Colors.blue)),
              ),
          ],
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

class ChequingPage extends StatelessWidget {
  final Function(String) onAccountOpened;

  const ChequingPage({super.key, required this.onAccountOpened});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chequing"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.percent,
                size: 100,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Chequing",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Earn 1.75% interest",
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const Text(
              "High interest. No monthly fees. And everything you need for everyday banking.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              "More chequing accounts, more possibilities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            _buildFeature("Organize your money with up to 8 accounts"),
            _buildFeature("Pay no monthly fees"),
            _buildFeature("Save for specific goals like travel or a home"),
            _buildFeature("Build up an emergency fund for a rainy day"),
            _buildFeature("Set aside money for bills to avoid overspending"),
            const SizedBox(height: 16),
            const Text(
              "Everything you need for everyday banking",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  onAccountOpened("Chequing");
                  Navigator.popUntil(context, (route) => route.isFirst);
                  // SnackBar handled in main.dart
                },
                child: const Text("Open account"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.black))),
        ],
      ),
    );
  }
}

class TFSAPage extends StatelessWidget {
  final Function(String) onAccountOpened;

  const TFSAPage({super.key, required this.onAccountOpened});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tax-free savings account (TFSA)"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.account_balance_wallet,
                size: 100,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Tax-free savings account (TFSA)",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Text(
              "The perfect account for any spending goal – buying a home, building an emergency fund, saving for retirement and more.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildFeature("Annual contribution limit: \$7,000 for 2025"),
            _buildFeature("Growth and withdrawals are tax-free"),
            _buildFeature("Contribution deadline: December 31"),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  onAccountOpened("TFSA");
                  Navigator.popUntil(context, (route) => route.isFirst);
                  // SnackBar handled in main.dart
                },
                child: const Text("Open account"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.black))),
        ],
      ),
    );
  }
}

class USDSavingsPage extends StatelessWidget {
  final Function(String) onAccountOpened;

  const USDSavingsPage({super.key, required this.onAccountOpened});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("USD Savings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.account_balance,
                size: 100,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "USD Savings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Grow U.S. dollar savings with high-interest and no monthly fees.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildFeature("Earn 3% interest on every U.S. dollar in your account"),
            _buildFeature("Transfer and convert money instantly between your chequing and USD savings accounts"),
            _buildFeature("Move U.S dollars to any USD trade account at anytime"),
            _buildFeature("No monthly account fees or minimum balance"),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  onAccountOpened("USD Savings");
                  Navigator.popUntil(context, (route) => route.isFirst);
                  // SnackBar handled in main.dart
                },
                child: const Text("Open account"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}