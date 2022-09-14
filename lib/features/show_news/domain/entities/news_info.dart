class NewsInfo {
  final String? title;
  final String? author;
  final String? imageURL;
  final String? content;
  final DateTime datetime;

  const NewsInfo({
    this.author,
    this.title,
    this.imageURL,
    required this.datetime,
    this.content,
  });
}
