import 'article.dart';

class NewsListModel {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  NewsListModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Articles>.from(
            json["articles"].map((a) => Articles.fromJson(a))),
      );
}
