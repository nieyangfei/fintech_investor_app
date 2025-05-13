import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news_service.dart';
import '../models/stock_service.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ["Stocks", "ETFs", "Crypto", "Options"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Discover"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 📰 News Headlines (Clickable)
          SizedBox(
            height: 160,
            child: FutureBuilder<List<News>>(
              future: NewsService.fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final newsList = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsList[index];
                    return GestureDetector(
                      onTap: () async {
                        final uri = Uri.parse(news.url);
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri, mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Container(
                        width: 260,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(news.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            "${news.site} • ${news.title}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // 🧭 Tab Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedTabIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedTabIndex = index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // 📊 Tab Content (Stocks, ETFs, Crypto, Options)
          Expanded(
            child: Builder(
              builder: (context) {
                switch (selectedTabIndex) {
                  case 0:
                    return FutureBuilder(
                      future: StockService.fetchTopGainers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Error: ${snapshot.error}"));
                        }

                        final stocks = snapshot.data!;
                        return ListView.builder(
                          itemCount: stocks.length,
                          itemBuilder: (context, index) {
                            final stock = stocks[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(stock.symbol[0], style: const TextStyle(color: Colors.white)),
                              ),
                              title: Text(stock.symbol),
                              subtitle: Text(stock.name),
                              trailing: Text(
                                stock.changePercent,
                                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        );
                      },
                    );
                  case 1:
                    return ListView(
                      children: const [
                        ListTile(title: Text("VOO - Vanguard S&P 500 ETF")),
                        ListTile(title: Text("ARKK - ARK Innovation ETF")),
                        ListTile(title: Text("SPY - SPDR S&P 500 ETF Trust")),
                      ],
                    );
                  case 2:
                    return ListView(
                      children: const [
                        ListTile(title: Text("BTC - Bitcoin")),
                        ListTile(title: Text("ETH - Ethereum")),
                        ListTile(title: Text("SOL - Solana")),
                      ],
                    );
                  case 3:
                    return ListView(
                      children: const [
                        ListTile(title: Text("Call Option - AAPL \$180")),
                        ListTile(title: Text("Put Option - TSLA \$150")),
                      ],
                    );
                  default:
                    return const Center(child: Text("Coming soon..."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
