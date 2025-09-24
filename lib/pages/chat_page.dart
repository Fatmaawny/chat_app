import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
 static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: KprimaryColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Klogo,
            height: 62,),
            SizedBox(width: 10,),
            Text("Chaty app"),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
