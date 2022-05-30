import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String Email;
  late String Password;
  bool Spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Spinner,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'icon',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      Email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      Password = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            // Spinner = true;
                          });
                          try {
                            final NewUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: Email, password: Password);
                            if (NewUser != null) {
                              Spinner = true;
                              Navigator.pushNamed(context, 'ChatScreen');
                            }
                            setState(() {
                              Spinner = false;
                            });
                          } catch (x) {
                            Spinner = false;
                            String error = x.toString();
                            print(x);
                            print(error);
                            final snackBAr = SnackBar(
                                content: Text(error),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBAr); ScaffoldMessenger.of(context)
                                .showSnackBar(snackBAr);

                            /*  if (Password != null && Email != null) {
                              final snackBAr = SnackBar(
                                  content: Text('User Already Exist'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBAr);
                            } else {
                              final snackBAr = SnackBar(
                                  content:
                                      Text('Email or Password Cant be Empty'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBAr);
                            } */

                          }
                          ;
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
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
  }
}
