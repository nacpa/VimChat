import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Start.dart';
import '../background.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState(){
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 4))..forward();
    _animation=CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    Timer(Duration(seconds: 5,microseconds: 500),(){
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          Get.off(Background(),transition: Transition.cupertino
          );
        } else {
          Get.off(StartChat(),transition: Transition.cupertino
          );
        }
      });
    });}
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.grey[199],
      child: Center(child: ScaleTransition(scale: _animation,
      child: Container(height: 400,width: double.maxFinite,color: Colors.white,
        child: Lottie.asset("assets/Json/VimChatLoGo.json",fit: BoxFit.fill),))),
    ),);
  }
}
