import 'package:flutter/material.dart';
import 'package:new_app/data/api.dart';
import 'package:new_app/screens/news_page.dart';
import 'package:new_app/screens/sign_up_page.dart';
import '../widgets/login_Signup_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  handleLogin() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      isLoading = true;
    });
    var res = await loginApi(email, password);
    if (res == 'Success!') {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isLoggedIn", true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => NewsPage()));
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/news_app_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeText(context),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        bottomContainerHeaderText('Sign in'),
                        SizedBox(height: 10),
                        textFormFields(context, 'Email:', emailController),
                        textFormFields(
                            context, 'Password:', passwordController),
                        forgotPasswordText(),
                        isLoading
                            ? CircularProgressIndicator()
                            : loginButton(handleLogin,'Sign In'),
                        SizedBox(height: 10),
                        optionsTextContainer(),
                        loginOptionsIcon(),
                        loginText(
                          context,
                          'Sign in',
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => SignUpPage()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
