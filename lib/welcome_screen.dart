import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


import 'Component.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset('images/logo.png'),
                    height: 50,
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['ViMcHaT'],
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            Button(
              text: Text('Login'),
              color: Colors.blueGrey,
              goToPage: 'LoginScreen',
            ),
            Button(
              text: Text('SignUp'),
              color: Colors.blue,
              goToPage: 'Registrationscreen',
            ),

          ],
        ),
      ),
    );
  }
}
