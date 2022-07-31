 import 'package:chatvim/Screens/Auth/SignUpPage.dart';
import 'package:chatvim/Screens/Start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Screens/Auth/LoginPage.dart';
import 'Screens/Splash/SplashScreen.dart';
import 'Screens/background.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( FlashChat());
}
class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        // home: ChatScreen(),
        home:Splash(),
        // home: StartChat(),
        //initialRoute: 'WelcomeScreen',
        routes: {
          'WelcomeScreen': (context) => Background(),
          'LoginScreen': (context) => LoginPage(),
          'Registrationscreen': (context) => SignUpPage(),
          // 'ChatScreen': (context) => ChatScreen(),
          'StartChat':(context)=>StartChat(),
        });
  }
}
