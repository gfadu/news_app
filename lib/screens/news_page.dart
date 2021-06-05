import 'package:flutter/material.dart';
import '../widgets/fav_news.dart';
import '../widgets/news_page_widgets.dart';
import '../widgets/news_container.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

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
