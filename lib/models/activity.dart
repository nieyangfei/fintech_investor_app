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
  static final List<Activity> _activityList = [
    Activity(
      type: 'Deposit Money',
      title: 'Bank Deposit',
      amount: '\$1,000.00',
      date: DateTime(2023, 5, 5),
      status: 'Completed',
    ),
    Activity(
      type: 'Transfer Money',
      title: 'Transfer to Brokerage',
      amount: '\$2,500.00',
      date: DateTime(2023, 5, 3),
      status: 'Completed',
    ),
    Activity(
      type: 'Withdraw Money',
      title: 'Withdrawal to Bank',
      amount: '\$1,200.00',
      date: DateTime(2023, 5, 1),
      status: 'Completed',
    ),
    Activity(
      type: 'Wire Funds',
      title: 'Wire to International Account',
      amount: '\$5,000.00',
      date: DateTime(2023, 5, 6),
      status: 'Processing',
    ),
    Activity(
      type: 'Automated Deductions',
      title: 'Monthly Investment Plan',
      amount: '\$300.00',
      date: DateTime(2023, 4, 28),
      status: 'Completed',
    ),
    Activity(
      type: 'Deposit Money',
      title: 'ACH Transfer from Bank',
      amount: '\$2,000.00',
      date: DateTime(2023, 5, 7),
      status: 'Completed',
    ),
    Activity(
      type: 'Transfer Money',
      title: 'Transfer to Mutual Fund',
      amount: '\$1,500.00',
      date: DateTime(2023, 5, 4),
      status: 'Completed',
    ),
    Activity(
      type: 'Withdraw Money',
      title: 'Sell Apple Stock',
      amount: '\$750.00',
      date: DateTime(2023, 5, 2),
      status: 'Completed',
    ),
    Activity(
      type: 'Wire Funds',
      title: 'Wire to Waze Broker',
      amount: '\$4,000.00',
      date: DateTime(2023, 5, 3),
      status: 'Completed',
    ),
    Activity(
      type: 'Automated Deductions',
      title: 'Quarterly Tax Deductions',
      amount: '\$600.00',
      date: DateTime(2023, 5, 1),
      status: 'Completed',
    ),
  ];

  static List<Activity> get activities => List.unmodifiable(_activityList);

  /// Method to create a new [Activity] log
  static void addActivity(Activity newActivity) {
    _activityList.insert(0, newActivity);
  }
}
