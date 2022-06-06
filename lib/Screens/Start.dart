import 'package:chatvim/Screens/chat_screen.dart';
import 'package:chatvim/Streams/UserInfoStream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
            Lottie.network(
                "https://assets9.lottiefiles.com/packages/lf20_fjv8qxqn.json"),
            GestureDetector( onTap: (){
              Get.to(UserList());
            },
              child: Container(
                height: 60,
                width: 230,
                child: Center(
                    child: Text(
                  "Start Chatting",
                  style: TextStyle(
                      color: Colors.white.withOpacity(1),
                      fontSize: 25,
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
                  borderRadius: BorderRadius.circular(30),
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
