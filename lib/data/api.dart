import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> loginApi(email, password) async {
  Map body = {"email": email, "password": password};

  var res = await http.post(
    Uri.parse('https://nodejs-register-login-app.herokuapp.com/login'),
    body: body,
  );

  if (res.statusCode == 200) {
    return json.decode(res.body)['Success'];
  }
  return "error";
}

Future<String> signUpApi(email, password, confirmPassword) async {
  Map body = {
    "email": email,
    "username": "test",
    "password": password,
    "passwordConf": confirmPassword
  };
  try {
    var res = await http.post(
      Uri.parse("https://nodejs-register-login-app.herokuapp.com"),
      body: body,
    );
    if (res.statusCode == 200) {
      if (jsonDecode(res.body)['Success'] ==
          "You are regestered,You can login now.") {
        return "Success";
      }
      return json.decode(res.body)['Success'];
    }
    return 'error';
  } catch (error) {
    return 'error';
  }
}

Future<void> getNewsAPI() async {
  var response =
      await http.get(Uri.parse('https://api.first.org/data/v1/news'));

  print(json.decode(response.body));
}
