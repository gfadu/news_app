import 'dart:ui';
import 'package:new_app/data/api.dart';
import 'package:new_app/screens/login_page.dart';
import '../widgets/login_Signup_widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  handleSignUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    setState(() {
      isLoading = true;
    });
    print(email + "," + password + "," + confirmPassword);
    var response = await signUpApi(email, password, confirmPassword);

    if (response == "Success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => LoginPage()));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (builder) => NewsPage()));
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response),
      ));
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
                        bottomContainerHeaderText('Sign Up'),
                        SizedBox(height: 10),
                        textFormFields(context, 'Email:', emailController),
                        textFormFields(
                            context, 'Password:', passwordController),
                        textFormFields(context, 'Re-enter Password:',
                            confirmPasswordController),
                        isLoading
                            ? CircularProgressIndicator()
                            : loginButton(handleSignUp, 'Sign Up'),
                        SizedBox(height: 10),
                        optionsTextContainer(),
                        loginOptionsIcon(),
                        loginText(
                          context,
                          'Sign up',
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => LoginPage()));
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
