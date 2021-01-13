import 'dart:convert';

import 'package:flutter_app_newsappproject/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&apiKey=2ccbe97c353e4a64907688ef4dd5f9c2";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            description: element["description"],
            content: element["content"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=2ccbe97c353e4a64907688ef4dd5f9c2";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            description: element["description"],
            content: element["content"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}


