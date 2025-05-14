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

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No Title',
      image: json['image_url'] ?? '',
      site: json['source_id'] ?? 'Unknown',
      url: json['link'] ?? '',
    );
  }
}
