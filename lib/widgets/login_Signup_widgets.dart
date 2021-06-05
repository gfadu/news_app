import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget bottomContainerHeaderText(text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.indigo,
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
  );
}

Widget textFormFields(context, hint, controller) {
  return Container(
    height: 40,
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xffAF8A7C),
    ),
    child: TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.all(12)),
    ),
  );
}

Widget loginButton(onPressed,text) {
  return TextButton(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Widget optionsTextContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 100,
        color: Colors.grey.withOpacity(0.5),
        height: 2,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        'Or Sign Up With',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        width: 100,
        color: Colors.grey.withOpacity(0.5),
        height: 2,
      )
    ],
  );
}

Widget loginOptionsIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/google.png'),
      ),
      SizedBox(
        width: 30,
      ),
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/facebook.png'),
      )
    ],
  );
}

Widget loginText(context, text, onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Have an account?'),
      InkWell(
        onTap: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.orange),
        ),
      )
    ],
  );
}

Widget welcomeText(context) {
  return Container(
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.15, left: 50),
    child: Text(
      'Welcome!!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget forgotPasswordText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  );
}
