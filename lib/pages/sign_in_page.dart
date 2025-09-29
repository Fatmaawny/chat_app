import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_snack_bar.dart';
import '../widgets/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});
  static String id = 'SignInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;
  String? password;
  GlobalKey <FormState> key = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
            child: Form(
              key: key,
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
                  CustomTextFormField(
                    hintText: "Email",
                    onChanged: (data) {
                      email = data;
                    }, isTextSecure: false,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'Password',
                    onChanged: (data) {
                      password = data;
                    }, isTextSecure: true,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'Sign In',
                    onTapFunction: () async {
                      if (key.currentState!.validate()) {
                        isLoading =true;
                        setState(() {});
                        Navigator.pushNamed(context, ChatPage.id,arguments:email);
                        try {
                          UserCredential credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                          customSnackBar(context, "Success");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-credential') {
                            customSnackBar(context, "please try again");
                          }
                        } catch (e) {
                          customSnackBar(context, "please try again");
                        }
                        isLoading =false;
                        setState(() {
                        });
                      }else{}
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
        ),
      ),
    );
  }
}
