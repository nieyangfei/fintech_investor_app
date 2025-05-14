import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fintech_investor_app/models/news.dart';

class NewsService {
  static Future<List<News>> fetchNews() async {
    final url =
        'https://newsdata.io/api/1/news?apikey=pub_86840580289676743130062b95e34678952c2&country=us&category=business&language=en';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List articles = jsonData['results'];
        return articles.map((e) => News.fromJson(e)).toList();
      } else {
        throw Exception('News API error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('News fetch failed: $e');
    }
  }

  static Future<List<News>> fetchCryptoNews() async {
    final url =
        'https://newsdata.io/api/1/news?apikey=pub_86840580289676743130062b95e34678952c2&q=crypto&category=business&language=en';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List articles = jsonData['results'];
        return articles.map((e) => News.fromJson(e)).toList();
      } else {
        throw Exception('Crypto API error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Crypto fetch failed: $e');
    }
  }
}
