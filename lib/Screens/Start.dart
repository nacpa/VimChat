import 'package:chatvim/Screens/chat_screen.dart';
import 'package:chatvim/Streams/UserInfoStream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../consts/Dimension.dart';

class StartChat extends StatelessWidget {
  const StartChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
                "assets/Json/LottieChat.json"),
            GestureDetector( onTap: (){
              Get.to(UserList(),transition: Transition.cupertino);
            },
              child: Container(
                height: Dim.Hight10*6.0,
                width: Dim.Hight10*23.0,
                child: Center(
                    child: Text(
                  "Start Chatting",
                  style: TextStyle(
                      color: Colors.white.withOpacity(1),
                      fontSize: Dim.Hight10*2.5,
                      letterSpacing: 1,
                      wordSpacing: 1,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-10, 5),
                        color: Colors.grey,
                        spreadRadius: 0,
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(Dim.Hight10*3.0),
                  color: Colors.greenAccent.shade400,
                ),
              ),
            )
          ],
        ),
        color: Colors.blue.shade100,
      ),
    );
  }
}
