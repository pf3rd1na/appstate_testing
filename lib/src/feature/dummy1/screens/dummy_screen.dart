import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy1/models/article.dart';
import 'package:flutter_sport_news/src/feature/dummy1/models/news_list.dart';
import 'package:flutter_sport_news/src/feature/dummy1/providers/news_provider.dart';

import '../widgets/safe_network_image.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  var _showNews = false;
  late NewsListModel? _newsList;

  void _openNews(Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(article.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SafeNetworkImage(url: article.urlToImage),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.content ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadNews() async {
    _newsList = await NewsProvider.loadNewsList();
    setState(() {
      _showNews = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return !_showNews
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _newsList!.articles.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  _openNews(_newsList!.articles[index]);
                },
                leading: SafeNetworkImage(
                  url: _newsList!.articles[index].urlToImage,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(_newsList!.articles[index].title),
                subtitle: Text(_newsList!.articles[index].source.name),
              );
            },
          );
  }
}
