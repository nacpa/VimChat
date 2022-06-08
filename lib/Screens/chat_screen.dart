import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Streams/ChatStream.dart';
import '../consts/Dimension.dart';
import '../consts/constants.dart';

late User loggedInUser;
final _FireData = FirebaseFirestore.instance;
class ChatScreen extends StatefulWidget {
  ChatScreen({required this.ReceiverName});
  late String  ReceiverName;
  @override
  _ChatScreenState createState() => _ChatScreenState(ReceiverName: ReceiverName);
}

class _ChatScreenState extends State<ChatScreen> {

   _ChatScreenState({required this.ReceiverName});

  late String  ReceiverName;




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
      appBar:
      AppBar(toolbarHeight: Dim.Hight*0.08,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                snackBAr = SnackBar(
                    content: Text('LOGOUT SUCESSFULLY'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {

                      },
                    ));
                _auth.signOut();
                Get.offNamed("LoginScreen");
              }),
        ],
        title:  Text(ReceiverName),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: size.height * 0.80,
                child: streamBuilder(ReceiverName: ReceiverName,),
              ),
              Container(decoration: BoxDecoration( color: Colors.grey.shade50,image: DecorationImage(image: AssetImage('assets/images/chatBottomWallpaper.jpg'),fit: BoxFit.fill)),
                width: double.maxFinite,
                height: Dim.Hight*0.0864,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(Dim.Hight10*5)),
                      height: Dim.Hight10*6.0,
                      width: Dim.Hight10*38.0,
                      child: TextField(style: TextStyle(color: Colors.white,fontSize: Dim.Hight10*2.0  ),
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
                            "Reciver" : ReceiverName
                            // 'receiver':
                        }
                        );
                        TextMessag="";}else{TextMessag="";}

                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(Dim.Hight10*6.0)),
                          height: Dim.Hight10*6.0,
                          width: Dim.Hight10*6.0,
                          child: Padding(
                            padding: EdgeInsets.all(Dim.Hight10*0.4),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: Dim.Hight10*4,
                            ),
                          )),
                    ),
                  ],
                ),
              ),

            ],
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
