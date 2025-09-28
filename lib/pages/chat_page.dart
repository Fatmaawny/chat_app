import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  static String id = 'ChatPage';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),

        builder: (context, snapshot){
          for(int i=0;i<snapshot.data!.docs.length;i++){
            print(snapshot.data!.docs[i]['text']);
          }
          if(snapshot.hasData){
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
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ChatBubble(text: snapshot.data!.docs[index]['text']),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) async {
                        await messages.add({'text': data});
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        hintText: "Send a message",
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: KprimaryColor),
                          onPressed: () async {
                            if (controller.text.isNotEmpty) {
                              await messages.add({'text': controller.text});
                              controller.clear();
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
          }
          else
            return Text("waiting...");

        });
  }
}
