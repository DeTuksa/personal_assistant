import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

String apiKey = "e24cf1e0ebca4239bd5d805782145982";

class NewsModel extends ChangeNotifier {
  List<Article> news = [];
  Article randomArticle;

  NewsModel() {
    getNews();
    notifyListeners();
  }

  Future<void> getNews() async {
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=ng&apiKey=$apiKey');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element['urlToImage'] != null
        && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url']
          );
          print(article.title);
          news.add(article);
          notifyListeners();
        }
      });
    }

    randomArticle = getRandomElement(news);
    notifyListeners();
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}

class CategoryModel {
  String imageUrl;
  String categoryName;
}

class Article{

  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publishedAt;
  String content;
  String articleUrl;

  Article({this.title,this.description,this.author,this.content,this.publishedAt,
    this.urlToImage, this.articleUrl});
}