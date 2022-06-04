import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/chat_screen.dart';
import '../consts/BubbleText.dart';

class streamBuilder extends StatelessWidget {
  const streamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _FireData = FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(
      stream: _FireData.collection('Text')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.data == null) return Center(child: CircularProgressIndicator(color: Colors.orange,));
        final Messages = snapshot.data.docs;
        List<BubbleText> MessagesWeigets = [];
        for (var message in Messages) {
          final TextMessage = message.data()['Text'];
          final TextUser = message.data()['User'];
          final currentuser = loggedInUser.displayName;
          if (currentuser == TextUser) {
            print("yes");
          }else{print("${TextUser}${currentuser}");}
          final MessageWeiget = BubbleText(
            TextMessage: TextMessage,
            TextUser: TextUser,
            itsMe: currentuser==TextUser ,


          );
          MessagesWeigets.add(MessageWeiget);
        }
        return  Container(
          child: Padding(
            padding:  EdgeInsets.all(2.0),
            child: ListView(
              reverse: true,
              children: MessagesWeigets,
            ),
          ),
        );
      },
    );
  }
}