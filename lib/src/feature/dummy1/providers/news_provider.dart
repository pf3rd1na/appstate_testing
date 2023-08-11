import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_sport_news/src/feature/dummy1/models/news_list.dart';

const String apiUrl =
    'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=ada93acb562443ea83a626f95bbe545c';

class NewsProvider {
  static NewsListModel? _newsList;

  static Future<NewsListModel?> loadNewsList() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      _newsList = NewsListModel.fromJson(json.decode(response.body));
    }

    return _newsList;
  }
}
