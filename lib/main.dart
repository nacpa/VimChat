import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'background.dart';
import 'registration_screen.dart';
import 'chat_screen.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Background(),
        //initialRoute: 'WelcomeScreen',
        routes: {
          'WelcomeScreen': (context) => WelcomeScreen(),
          'LoginScreen': (context) => LoginPage(),
          'Registrationscreen': (context) => SignUpPage(),
          'ChatScreen': (context) => ChatScreen()
        });
  }
}
