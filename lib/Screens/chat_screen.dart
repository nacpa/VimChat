import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Streams/ChatStream.dart';
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
                Container(
                  height: size.height * 0.84,
                  child: streamBuilder(),
                ),
                Container(
                  height: size.height * 0.06,
                  width: double.maxFinite,
                  color: Colors.grey.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(50)),
                        height: 50,
                        width: 350,
                        child: TextField(
                          controller: _controller,
                          onChanged: (value) {
                            TextMessag = value==null ?"": value;
                            //Do something with the user input.
                          },
                          decoration: kMessageTextFieldDecoration,
                          cursorColor: Colors.orange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(TextMessag!=""){  _controller.clear();
                            _FireData.collection('Text').add({
                            'Text': TextMessag,
                            'User': loggedInUser.displayName ?? loggedInUser.email,
                            'timestamp': FieldValue.serverTimestamp(),
                          }
                          );
                          TextMessag="";}else{TextMessag="";}

                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(50)),
                            height: 50,
                            width: 50,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.send,
                                color: Colors.orange,
                                size: 36,
                              ),
                            )),
                      ),
                    ],
                  ),
                )
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
