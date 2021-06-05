import 'package:flutter/cupertino.dart';

import 'dart:async';

class News with ChangeNotifier {
  final int id;
  final String title;
  final String summary;
  final String published;
  bool isFavourite;
  

  News(
      {required this.id,
      required this.title,
      required this.summary,
      required this.published,
      this.isFavourite = false});

  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }



  void autoLogout() {}
}
