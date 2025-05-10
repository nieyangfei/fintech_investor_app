class Activity {
  final String type;
  final String title;
  final String amount;
  final DateTime date;
  final String status;

  Activity({
    required this.type,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
  });
}

class Activities {
  static List<Activity> get activities {
    return [
      Activity(
        type: 'Orders',
        title: 'Amazon Purchase',
        amount: '\$49.99',
        date: DateTime(2023, 5, 5),
        status: 'Completed',
      ),
      Activity(
        type: 'Transfers',
        title: 'Transfer to John',
        amount: '\$100.00',
        date: DateTime(2023, 5, 3),
        status: 'Completed',
      ),
      Activity(
        type: 'Deposits',
        title: 'Salary Deposit',
        amount: '\$2,500.00',
        date: DateTime(2023, 5, 1),
        status: 'Completed',
      ),
      Activity(
        type: 'Pending',
        title: 'Restaurant Payment',
        amount: '\$35.75',
        date: DateTime(2023, 5, 6),
        status: 'Processing',
      ),
      Activity(
        type: 'Orders',
        title: 'Netflix Subscription',
        amount: '\$14.99',
        date: DateTime(2023, 4, 28),
        status: 'Completed',
      ),
    ];
  }
}
