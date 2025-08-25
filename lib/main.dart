import 'package:chat_app/pages/sign_in_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignInPage.id : (context) =>SignInPage(),
        SignUpPage.id : (context) =>SignUpPage(),
      },
      theme: ThemeData(
        fontFamily:"Ubuntu"
      ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'SignInPage');
  }
}
