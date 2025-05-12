class Stock {
  final String symbol;
  final String name;
  final String changePercent;

  Stock({required this.symbol, required this.name, required this.changePercent});
}

class StockService {
  static Future<List<Stock>> fetchTopGainers() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate delay

    return [
      Stock(symbol: "ASST", name: "Asset Entities Inc.", changePercent: "+49.85%"),
      Stock(symbol: "QBTS", name: "D-Wave Quantum", changePercent: "+26.42%"),
      Stock(symbol: "NVDA", name: "NVIDIA Corp", changePercent: "+12.03%"),
      Stock(symbol: "TSLA", name: "Tesla Inc.", changePercent: "+9.72%"),
      Stock(symbol: "META", name: "Meta Platforms", changePercent: "+7.10%"),
      Stock(symbol: "AAPL", name: "Apple Inc.", changePercent: "+4.85%"),
      Stock(symbol: "GOOGL", name: "Alphabet Inc.", changePercent: "+3.44%"),
      Stock(symbol: "MSFT", name: "Microsoft Corp", changePercent: "+2.28%"),
    ];
  }
}
