import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'Opacity.dart';

class SignUpPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String Email;
  late String Password;
  @override
  Widget build(BuildContext context) {
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
                                      child: TextField( onChanged: (value){
                                        Email=value;
                                      },
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
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[800])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField( onChanged: (value){Password=value;},
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Confirm Password",
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

                              GestureDetector(onTap: ()async{
                                final NewUser=await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
                                try{
                                  if(NewUser!=null){
                                    Navigator.pushNamed(context, 'LoginScreen');
                                  }
                                }catch(e){
                                  print(e);
                                  final snackBAr = SnackBar(
                                      content: Text(e.toString()),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {},
                                      ));
                                }
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
