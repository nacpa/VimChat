import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../consts/CustomSnackbar.dart';
import '../../consts/Opacity.dart';



class SignUpPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String Email;
  late String Password;
  @override
  Widget build(BuildContext context) {
    var PhoneController = TextEditingController();
    var PassWordcontroller = TextEditingController();
    var Emailcontroller = TextEditingController();
    var Namecontroller = TextEditingController();

    void _Registration() {
      String Email = Emailcontroller.text.trim();
      String Password = PassWordcontroller.text.trim();
      String Name = Namecontroller.text.trim();
      String MobileNo = PhoneController.text.trim();

      if (Email.isEmpty) {
        CustomSnackBar("Email can't be Empty", "please Fill valid mail",
            Colors.red, Colors.white);
      } else if (Password.isEmpty) {
        CustomSnackBar("Password can't be Empty", "please Fill valid Password",
            Colors.red, Colors.white);
      } else if (Name.isEmpty) {
        CustomSnackBar("Name can't be Empty", "please Fill your name",
            Colors.red, Colors.white);
      } else if (MobileNo.isEmpty) {
        CustomSnackBar("PhoneNo can't be Empty", "please Fill valid PhoneNo",
            Colors.red, Colors.white);
      } else if (!GetUtils.isEmail(Email)) {
        CustomSnackBar(
            "Wrong Email ", "please Fill valid mail", Colors.red, Colors.white);
      } else {
        _auth
            .createUserWithEmailAndPassword(email: Email, password: Password)
            .then((value) {
          _auth.currentUser?.updateProfile(
            displayName: Name,
          );
          _auth.currentUser?.linkWithPhoneNumber(MobileNo);
          Get.offNamed("LoginScreen");

        });

        CustomSnackBar(
            "Welcome", "Signup Sucessfully", Colors.green, Colors.white);
      }
    }

    return Expanded(
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold( resizeToAvoidBottomInset: true,
            body: Container(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: ClipPath(
                      clipper: WaveCliper1(),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.purple, Colors.deepPurple])),
                        child: null,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 1,
                    child: ClipPath(
                      clipper: WaveCliper(),
                      child: Container(
                        height: 850,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  spreadRadius: 50,
                                  blurRadius: 40.0,
                                  offset: Offset(5, 10))
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.purple, Colors.deepPurple])),
                        child: null,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child:
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
                        )),
                  Positioned(
                    top: 190,
                    right: 20,
                    child:
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/pig.png'))),
                        )),
                  Opacity(
                    opacity: 0.2,
                    child: ClipPath(
                      clipper: WaveCliper(),
                      child: Container(
                        height: 1000,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.purple, Colors.deepPurple])),
                        child: null,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: MediaQuery.of(context).size.width/12,
                    right: MediaQuery.of(context).size.width/12,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          spreadRadius: 20,
                                          blurRadius: 30.0,
                                          offset: Offset(5, 10))
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.deepPurple))),
                                      child: TextField(
                                        controller: Namecontroller,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Name",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.deepPurple))),
                                      child: TextField( controller: Emailcontroller,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.deepPurple))),
                                      child: TextField(controller: PassWordcontroller,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField( controller: PhoneController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Phone No",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800])),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          SizedBox(
                            height: 30,
                          ),

                              GestureDetector(onTap: (){
                                _Registration();
                              },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.purple,
                                            Colors.deepPurple
                                          ])),
                                  child: Center(
                                    child: Text(
                                      "Sign UP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                ),
                              ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
