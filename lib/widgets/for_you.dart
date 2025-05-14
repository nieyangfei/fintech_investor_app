import 'package:flutter/material.dart';

class ForYou extends StatelessWidget {
  const ForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'For you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _forYouCard(
                  title: "Refer a friend\nand earn",
                  subtitle:
                  "Share your referral link with a friend and you'll both get \$25 when they join. T&Cs apply.",
                  icon: Icons.arrow_forward,
                  backgroundColor: Colors.blue.shade100,
                ),
                const SizedBox(width: 12),
                _forYouCard(
                  title: "Benefits boost",
                  subtitle:
                  "Create more value with your investments and receive boosted benefits.",
                  icon: Icons.arrow_forward,
                  backgroundColor: Colors.green.shade100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _forYouCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
  }) {
    return Container(
      width: 250,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(icon, size: 24),
          ),
        ],
      ),
    );
  }
}
