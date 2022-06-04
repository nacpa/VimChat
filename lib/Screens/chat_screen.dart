import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../consts/constants.dart';

late User loggedInUser;

final _FireData = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String TextMessag;
  late String Username;


  set snackBAr(SnackBar snackBAr) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentUser();
  }

  void GetCurrentUser() async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      snackBAr = SnackBar(
          content: Text(e.toString()),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                snackBAr = SnackBar(
                    content: Text('LOGOUT SUCESSFULLY'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ));
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(height: size.height*0.84,
                  child: streamBuilder(),
                ),
                Container(height: size.height*0.06,width: double.maxFinite,color: Colors.grey.shade50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),height: 50,width: 350,child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        TextMessag = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                      cursorColor: Colors.orange,
                    ),),
                    GestureDetector(onTap: (){

                      _controller.clear();
                                     _FireData.collection('Text').add({
                                  ''
                                         'Text': TextMessag,
                                     'User': loggedInUser.email,
                                   'timestamp': FieldValue.serverTimestamp(),
                                   });

                    },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(50)),height: 50,width: 50,child:

                             Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.send,
                              color: Colors.orange,
                              size: 36,
                            ),
                          )),
                    ),
                  ],
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty('loggedInuser', loggedInUser));
  }
}

class BubbleText extends StatelessWidget {
  const BubbleText(
      {Key? key,
        required this.TextMessage,
        required this.TextUser,
        required this.itsMe})
      : super(key: key);

  final String TextMessage;
  final String TextUser;
  final bool itsMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
        itsMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Form➢ $TextUser',
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Material(
            elevation: 10,
            borderRadius: itsMe
                ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
                : const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color: itsMe ? Colors.orange : Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  TextMessage,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class streamBuilder extends StatelessWidget {
  const streamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _FireData.collection('Text')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final Messages = snapshot.data.docs;
        List<BubbleText> MessagesWeigets = [];
        for (var message in Messages) {
          final TextMessage = message.data()['Text'];
          final TextUser = message.data()['User'];
          final currentuser = loggedInUser.email;
          if (currentuser == TextUser) {}
          final MessageWeiget = BubbleText(
            TextMessage: TextMessage,
            TextUser: TextUser,
            itsMe: currentuser == TextUser,
          );
          MessagesWeigets.add(MessageWeiget);
        }
        return Container(
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
