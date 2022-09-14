import 'package:clean_architecture/features/show_news/domain/entities/news_info.dart';

class NewsInfoModel extends NewsInfo {
  NewsInfoModel({
    String? title,
    String? author,
    String? content,
    String? imageURL,
    String? dateTime,
  }) : super(
          title: title,
          author: author,
          imageURL: imageURL,
          content: content,
          datetime: _getDateTimeInDateTime(dateTime),
        );

  static DateTime _getDateTimeInDateTime(String? datetime) {
    if (datetime == null) {
      return DateTime.now();
    } else {
      final DateTime? datetimeInDateTimeFormat = DateTime.tryParse(datetime);
      if (datetimeInDateTimeFormat == null) {
        return DateTime.now();
      } else {
        return datetimeInDateTimeFormat;
      }
    }
  }

  factory NewsInfoModel.fromMap(Map<String, dynamic> map) {
    return NewsInfoModel(
      title: map['title'],
      author: map['author'],
      imageURL: map['urlToImage'],
      content: map['content'],
      dateTime: map['publishedAt'],
    );
  }
}
