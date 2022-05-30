
import 'package:chatvim/Screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/Opacity.dart';


class LoginPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String Email;
  late String Password;
  bool Spinner = false;


  void Signin(){
    if (Email.isEmpty) {
      Get.snackbar("Email can't be Empty", "please Fill valid mail");
    }else if(Password.isEmpty){
      Get.snackbar("PassWord can't be Empty", "please Fill valid Password");

    }else if(!GetUtils.isEmail(Email)){      Get.snackbar("Wrong Email ", "please Fill valid mail");
    }else{
      _auth.signInWithEmailAndPassword(email: Email, password: Password).then((value) => Get.offNamed('ChatScreen')).onError((error, stackTrace) {
        Get.snackbar(error.toString(), "Error");

      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),

                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),

                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),

                      Positioned(
                        child:  Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),



                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                     Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  spreadRadius: 30,
                                  blurRadius: 20.0,
                                  offset: Offset(5,10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.purple))
                              ),
                              child: TextField( onChanged: (Value){Email=Value;},
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey[500])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField( onChanged: (Value){Password=Value;},
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[500])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                       GestureDetector(onTap: ()  {Signin();
                       },
                         child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.purple, Colors.deepPurple])
                          ),
                          child: Center(
                            child: Text("LOGIN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,letterSpacing: 2),),
                          ),
                      ),
                       ),
                      SizedBox(height: 70,),
                      Text("Forgot Password?", style: TextStyle(fontSize: 20,color: Color.fromRGBO(150, 150, 251, 10)),),

                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}