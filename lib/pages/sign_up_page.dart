import 'package:chat_app/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFAF1A9), Color(0xFFECCBBD), Color(0xFFE4AC94)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 180,
                    child: Image.asset("assets/images/app_logo.png"),
                  ),
                  Text(
                    "Chaty",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(hintText: "Name"),
                  SizedBox(height: 10),
                  CustomTextField(hintText: "Phone"),
                  SizedBox(height: 10),
                  CustomTextField(hintText: "Email"),
                  SizedBox(height: 10),
                  CustomTextField(hintText: 'Password',),
                  SizedBox(height: 20),
                  CustomButton(text: 'Sign Up',),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          {
                            return SignInPage();
                          }));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xFFFAF1A9),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
