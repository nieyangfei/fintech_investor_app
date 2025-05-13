class News {
  final String title;
  final String image;
  final String site;
  final String url;

  News({
    required this.title,
    required this.image,
    required this.site,
    required this.url,
  });
}

class NewsService {
  static Future<List<News>> fetchNews() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate delay

    return [
      News(
        title: "Markets Rally Amid Fed Pause",
        image: "https://source.unsplash.com/featured/?stock,market",
        site: "Bloomberg",
        url: "https://www.bloomberg.com",
      ),
      News(
        title: "Tech Stocks Lead Recovery",
        image: "https://source.unsplash.com/featured/?technology,finance",
        site: "Reuters",
        url: "https://www.reuters.com",
      ),
      News(
        title: "Investors Eye CPI Data",
        image: "https://source.unsplash.com/featured/?economy,data",
        site: "CNBC",
        url: "https://www.cnbc.com",
      ),
      News(
        title: "Crypto Market Bounces Back",
        image: "https://source.unsplash.com/featured/?crypto,blockchain",
        site: "CoinDesk",
        url: "https://www.coindesk.com",
      ),
      News(
        title: "AI Stocks Take Center Stage",
        image: "https://source.unsplash.com/featured/?AI,finance",
        site: "TechCrunch",
        url: "https://techcrunch.com",
      ),
    ];
  }
}
