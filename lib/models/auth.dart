import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  late Timer _auth;

  void logOut() async {

  }

  void autoLogout() {
    _auth = Timer(Duration(seconds: 6), logOut);
  }
}
