import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email= ModalRoute.of(context)?.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('time',descending: true).snapshots(),
      builder: (context, snapshot) {
        List<MessageModel> messagesList = [];

        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messagesList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
        }
        if (snapshot.hasData) {
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
                  Text(
                    "Chaty app",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(messagesList[index].id== email){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ChatBubble(text: messagesList[index].message, name: messagesList[index].id.replaceFirst('@gmail.com', ''),),
                        );
                      } else return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ChatBubbleForFriend(text: messagesList[index].message, name: messagesList[index].id.replaceFirst('@gmail.com', ''),),
                      );

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) async {
                      await messages.add({
                        'id': email,
                        'text': controller.text,
                        'time': DateTime.now(),
                      });
                      controller.clear();
                      _controller.animateTo(
                        0,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: "Send a message",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send, color: KprimaryColor),
                        onPressed: () async {
                          if (controller.text.isNotEmpty) {
                            await messages.add({
                              'id': email,
                              'text': controller.text,
                              'time': DateTime.now(),
                            });
                            controller.clear();
                            _controller.animateTo(
                              0,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: KprimaryColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: KprimaryColor, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else
          return Center(child: Text("waiting..."));
      },
    );
  }
}
