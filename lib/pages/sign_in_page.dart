import 'package:chat_app/pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});
  static String id = 'SignInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;
  String? password;
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
              SizedBox(height: 50),
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
                "Sign In",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: "Email",
                onChanged: (data) {
                  email = data;
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                onChanged: (data) {
                  password = data;
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign In',
                onTapFunction: () async {
                  try {
                    UserCredential credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No user found for that email."),
                        ),
                      );
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Wrong password provided for that user.",
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: Text(
                      "Sign Up",
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
