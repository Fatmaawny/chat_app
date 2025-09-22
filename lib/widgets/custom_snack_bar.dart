import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String massege) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(massege)));
}