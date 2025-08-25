import 'package:flutter/material.dart';

import '../constants.dart';
class CustomButton extends StatelessWidget {
  CustomButton({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: KprimaryColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
