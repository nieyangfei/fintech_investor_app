import 'dart:convert';
import 'package:http/http.dart' as http;

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

class StockService {
  static Future<List<Stock>> fetchTopGainers() async {
    final url =
        'https://financialmodelingprep.com/api/v3/stock_market/gainers?apikey=ES4BWQuqY7z6KahqeA8lX8hDJi28e8Er';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Stock.fromJson(e)).toList();
      } else {
        throw Exception('Stock API error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Stock fetch failed: $e');
    }
  }
}
