import 'package:flutter/material.dart';
import 'package:unsad/view/mainScreen.dart';
import 'package:unsad/view/splashScreen.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UnSad",
        initialRoute: '/', // The initial route is the splash screen
        routes: {
          '/': (context) => SplashScreen(),
          '/mainScreen': (context) => MainScreen(),
        }

    );
  }
}

