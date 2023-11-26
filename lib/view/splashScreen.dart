import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay, then navigate to MainScreen
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/mainScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              width: MediaQuery.of(context).size.width,
              height: 300,
              "https://raw.githubusercontent.com/codewithdhruv22/CodeWithDhruv/main/applogo.png",
            ),
          ],
        ),
      ),
    );
  }
}
