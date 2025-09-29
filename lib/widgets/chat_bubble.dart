import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.text, required this.name});
final String text;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment. centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: KprimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(text,style: TextStyle(fontSize: 20),),
            ),
          ),
        ),
        Align(child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(name,style: TextStyle(fontSize: 15,color: Colors.grey)),
        ),alignment: Alignment.centerRight,),
      ],
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key, required this.text, required this.name});
  final String text;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment. centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: KprimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 17),
              child: Text(text,style: TextStyle(fontSize: 20),),
            ),
          ),
        ),
        Align(child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(name,style: TextStyle(fontSize: 15,color: Colors.grey)),
        ),alignment: Alignment.centerLeft,),
      ],
    );
  }
}
