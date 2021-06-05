import 'package:flutter/material.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/screens/news_page.dart';
import 'package:provider/provider.dart';
import 'screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var status = preferences.getBool('isLoggedIn') ?? false;
  runApp(ChangeNotifierProvider(
    create: (ctx) => NewsProvider(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (BuildContext context) {
            return status == true ? NewsPage() : LoginPage();
          },
        )),
  ));
}
