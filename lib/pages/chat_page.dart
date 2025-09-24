import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: KprimaryColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Klogo, height: 62),
            SizedBox(width: 10),
            Text("Chaty app"),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ChatBubble(text: "Hi how are you",),
          );
        },
      ),
    );
  }
}
