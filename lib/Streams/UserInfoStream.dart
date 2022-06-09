
import 'package:chatvim/Screens/chat_screen.dart';
import 'package:chatvim/consts/CustomSnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/Dimension.dart';

final _FireData = FirebaseFirestore.instance.collection("Users");
final _auth = FirebaseAuth.instance;
class SetInfo {
  SetInfo({required this.Uid});

  final String Uid;

  Future UpdateData(String Name, String Email, String Gender) async {
    return await _FireData.doc(Uid).set({
      "username": Name,
      "Email": Email,
      "Gender": Gender,
    });
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: _FireData.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: Scaffold(
              body: Container(
                  height: Dim.Hight10*5.0,
                  width: Dim.Hight10*5.0,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator(color: Colors.orange,))),
            ),
          );
        }
        final UserList = snapshot.data?.docs;
        print(UserList?.length);
        print(UserList?[0].data().toString());
        List<Map<String, String>> Users = [];
        UserList!.forEach((element) {


          if(element['username']!=_auth.currentUser?.displayName){Users.add({
            'Name': element['username'],
            'Email': element['Email'],
            'Gender': element['Gender'],
          });}

        });
        return Scaffold(
          appBar: AppBar(title: Text(_auth.currentUser!.displayName.toString()),
            backgroundColor: Colors.orange,
            shadowColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    CustomSnackBar("LogOut SucessFully", "${_auth.currentUser!.displayName.toString()}"+"LogOut SucessFully", Colors.greenAccent, Colors.black);
                    _auth.signOut();
                    Get.offNamed("WelcomeScreen");
                  }),
            ],
          ),
          body: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: Users.length,
                shrinkWrap: true,
                itemBuilder: (context, Pos) {
                  // print(Users[Pos]["Name"].toString());
                  return
                    GestureDetector(onTap: (){
                    Get.to(ChatScreen(ReceiverName: Users[Pos]["Name"].toString()),transition: Transition.zoom);
                  },
                    child: Container(
                      height: Dim.Hight10*7.0,
                      width: Dim.Hight10*10.0,
                      margin: EdgeInsets.all(Dim.Hight10*0.6),
                      child: Container(
                        margin: EdgeInsets.all(Dim.Hight10),
                        color: Colors.white,
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: Dim.Hight10*8.0,
                                width: Dim.Hight10*8.0,
                                padding: EdgeInsets.all(Dim.Hight10*0.2),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/collaboration.png"),
                                      fit: BoxFit.fill),
                                )),
                            SizedBox(width: Dim.Hight10,),
                            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${Users[Pos]["Name"].toString()}",overflow: TextOverflow.ellipsis,maxLines: 1,
                                  style: TextStyle(
                                      fontSize: Dim.Hight10*2.0,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dim.Hight10*1.0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-3, 4),
                                blurRadius: 4,
                                spreadRadius: 2,
                                color: Colors.grey.shade300,
                                blurStyle: BlurStyle.normal)
                          ],
                          color: Colors.white),
                    ),
                  );
                }),
          ),
        );

        //
      },
    );
  }
}
