import 'package:first_app/auth_page.dart';
import 'package:first_app/forgotpassword_page.dart';
import 'package:first_app/home_page.dart';
import 'package:flutter/material.dart';
import 'Create_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'متجرنا',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // خط عربي
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => AuthPage(isLogin: true),
        '/register': (context) => AuthPage(isLogin: false),
        '/forgot-password': (context) => ForgotPasswordPage(),
      },
    );
  }
}
