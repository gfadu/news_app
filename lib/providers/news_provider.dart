import 'package:flutter/cupertino.dart';
import 'dart:convert';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  List<News> _NewsList = [];

  List<News> get news {
    return [..._NewsList];
  }

  Future<void> getNewsApi() async {
    var response =
        await http.get(Uri.parse('https://api.first.org/data/v1/news'));

    var responseBody = jsonDecode(response.body);

    List<News> newsData = [];

    if (responseBody['status'] == "OK") {
      responseBody["data"].forEach((element) {
        if (element['summary'] != null) {
          News newsModel = News(
              id: element['id'],
              title: element['title'],
              summary: element['summary'],
              published: element['published']);
          newsData.add(newsModel);
        }
      });
      _NewsList = newsData;
      notifyListeners();
    }
  }
}
