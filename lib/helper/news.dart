import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$key";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            //author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            //publshedAt: DateTime.parse(element['publishedAt']),
            //content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$key";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            //author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            //publshedAt: DateTime.parse(element['publishedAt']),
            //content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
