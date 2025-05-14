class Stock {
  final String symbol;
  final String name;
  final String changePercent;

  Stock({
    required this.symbol,
    required this.name,
    required this.changePercent,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      changePercent: "${json['changesPercentage']}%",
    );
  }
}