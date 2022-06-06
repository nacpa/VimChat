import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/chat_screen.dart';
import '../consts/BubbleText.dart';

class streamBuilder extends StatelessWidget {
   streamBuilder({required this.ReceiverName}) ;
   final String ReceiverName;

  @override
  Widget build(BuildContext context) {
    final _FireData = FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(
      stream: _FireData.collection('Text')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null)
          return Center(
              child: CircularProgressIndicator(
            color: Colors.orange,
          ));
        final Messages = snapshot.data.docs;
        List<BubbleText> MessagesWeigets = [];

        for (var message in Messages) {
          if ( ( message.data()['User'] == loggedInUser.displayName && message.data()['Reciver'] == ReceiverName)|| (message.data()['User'] == ReceiverName && message.data()['Reciver'] == loggedInUser.displayName)) {
            final TextMessage = message.data()['Text'];
            final TextUser = message.data()['User'];
            final Texttime = message.data()['timestamp'];
            final currentuser = loggedInUser.displayName;
            if (currentuser == TextUser) {
              print("yes");
            } else {
              print("${TextUser}${currentuser}");
            }
            final MessageWeiget = BubbleText(
              TextMessage: TextMessage,
              TextUser: TextUser,
              itsMe: currentuser == TextUser,
              TextTime: Texttime == null ? Timestamp.now() : Texttime,
            );
            MessagesWeigets.add(MessageWeiget);
          }
        //
        }
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/chatBackground.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.all(0),
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
