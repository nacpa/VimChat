// import 'dart:ffi';
//
// import 'package:chatvim/Screens/chat_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// final _FireData = FirebaseFirestore.instance.collection("Users");
// final _auth = FirebaseAuth.instance;
// class SetInfo {
//   SetInfo({required this.Uid});
//
//   final String Uid;
//
//   Future UpdateData(String Name, String Email, String Gender) async {
//     return await _FireData.doc(Uid).set({
//       "username": Name,
//       "Email": Email,
//       "Gender": Gender,
//     });
//   }
// }
//
// class UserList extends StatelessWidget {
//   const UserList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _FireData.snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.data == null) {
//           return Center(
//             child: Expanded(
//               child: Container(
//                   height: 200,
//                   width: 200,
//                   color: Colors.white,
//                   child: CircularProgressIndicator()),
//             ),
//           );
//         }
//         final UserList = snapshot.data?.docs;
//         print(UserList?.length);
//         print(UserList?[0].data().toString());
//         List<Map<String, String>> Users = [];
//         UserList!.forEach((element) {
//           Users.add({
//             'Name': element['username'],
//             'Email': element['Email'],
//             'Gender': element['Gender'],
//           });
//         });
//         return Scaffold(
//           appBar: AppBar(title: Text(_auth.currentUser!.displayName.toString()),
//             backgroundColor: Colors.orange,
//             shadowColor: Colors.white,
//           ),
//           body: Container(
//             color: Colors.white,
//             child: ListView.builder(
//                 itemCount: UserList.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context, Pos) {
//                   // print(Users[Pos]["Name"].toString());
//                   return GestureDetector(onTap: (){
//                     Get.to(ChatScreen(ReceiverName: Users[Pos]["Name"].toString()));
//                   },
//                     child: Container(
//                       height: 100,
//                       width: 100,
//                       margin: EdgeInsets.all(15),
//                       child: Container(
//                         margin: EdgeInsets.all(10),
//                         color: Colors.white,
//                         child: Row(mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                                 height: 80,
//                                 width: 120,
//                                 padding: EdgeInsets.all(6),
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/collaboration.png"),
//                                       fit: BoxFit.fill),
//                                 )),
//                             Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${Users[Pos]["Name"].toString()}",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontStyle: FontStyle.italic,
//                                       letterSpacing: 1,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(Users[Pos]["Email"].toString(),
//                                     style: TextStyle(
//                                         fontSize: 19,
//                                         fontStyle: FontStyle.normal,
//                                         letterSpacing: 1,
//                                         fontWeight: FontWeight.w500)),
//                                 Text(Users[Pos]["Gender"].toString(),
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontStyle: FontStyle.normal,
//                                         fontWeight: FontWeight.w400)),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           boxShadow: [
//                             BoxShadow(
//                                 offset: Offset(-3, 4),
//                                 blurRadius: 4,
//                                 spreadRadius: 2,
//                                 color: Colors.grey.shade400,
//                                 blurStyle: BlurStyle.normal)
//                           ],
//                           color: Colors.white),
//                     ),
//                   );
//                 }),
//           ),
//         );
//
//         //
//       },
//     );
//   }
// }
