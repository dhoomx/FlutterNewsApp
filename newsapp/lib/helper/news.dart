import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;
//import 'package:http/http.dart' as http;
//import 'package:newsapp/views/article.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=sa&apiKey=ba2fd30b62ed459386a1a8970c2ef746";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              auther: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              // publishedAt: element["publishedAt"],
              content: element["context"]);
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
        "http://newsapi.org/v2/top-headlines?country=sa&category=$category&apiKey=ba2fd30b62ed459386a1a8970c2ef746";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              auther: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              // publishedAt: element["publishedAt"],
              content: element["context"]);
          news.add(articleModel);
        }
      });
    }
  }
}
