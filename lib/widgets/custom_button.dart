import 'package:flutter/material.dart';

import '../constants.dart';
class CustomButton extends StatelessWidget {
  CustomButton({required this.onTapFunction,required this.text});
  String text;
  VoidCallback onTapFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
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
      ),
    );
  }
}
