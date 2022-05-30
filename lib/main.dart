 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/background.dart';
import 'Auth/registration_screen.dart';
import 'Screens/chat_screen.dart';
import 'Auth/LoginPage.dart';
import 'Auth/SignUpPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Background(),
        //initialRoute: 'WelcomeScreen',
        routes: {
          'WelcomeScreen': (context) => Background(),
          'LoginScreen': (context) => LoginPage(),
          'Registrationscreen': (context) => SignUpPage(),
          'ChatScreen': (context) => ChatScreen()
        });
  }
}
