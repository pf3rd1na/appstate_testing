import 'article.dart';

class NewsListModel {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsListModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((a) => Article.fromJson(a))),
      );
}
