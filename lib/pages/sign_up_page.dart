import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  static String id = 'SignUpPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [KthirdColor, KsecondaryColor, KprimaryColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 30,),
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
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: "Name"),
              SizedBox(height: 10),
              CustomTextField(hintText: "Phone"),
              SizedBox(height: 10),
              CustomTextField(hintText: "Email"),
              SizedBox(height: 10),
              CustomTextField(hintText: 'Password'),
              SizedBox(height: 20),
              CustomButton(text: 'Sign Up'),
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: KthirdColor,
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
        ),
      ),
    );
  }
}
