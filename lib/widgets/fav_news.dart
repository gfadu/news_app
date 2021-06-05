import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_model.dart';
import './news_column.dart';

class FavNews extends StatelessWidget {
  const FavNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final individualNews = Provider.of<News>(context);
    return individualNews.isFavourite
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    individualNews.toggleFavourite();
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                NewsColumn(
                  header: individualNews.title,
                  summary: individualNews.summary,
                  published: individualNews.published,
                )
              ],
            ),
          )
        : Container();
  }
}
