import 'package:flutter/material.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/login_page.dart';
import '../widgets/news_page_widgets.dart';
import '../widgets/news_column.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var _isInit = true;
  var selectedpage = 'News';
  bool isLoading = false;

  setPage(Page) {
    setState(() {
      selectedpage = Page;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      isLoading = true;
      Provider.of<NewsProvider>(context)
          .getNewsApi()
          .then((_) => isLoading = false);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : NewWidget(selectedpage: selectedpage),
            BottomButtonsRow(setPage, selectedpage),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.selectedpage,
  }) : super(key: key);

  final String selectedpage;

  @override
  Widget build(BuildContext context) {
    final newsDataList = Provider.of<NewsProvider>(context);
    final newsData = newsDataList.news;
    return ListView.builder(
        itemCount: newsData.length,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: newsData[index],
              child: selectedpage == "News" ? NewsContainer() : FavNews(),
            ));
  }
}

class NewsContainer extends StatelessWidget {
  const NewsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final individualNews = Provider.of<News>(context);
    return Container(
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
              Icons.favorite_outline,
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
    );
  }
}

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
