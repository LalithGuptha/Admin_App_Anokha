import 'package:admin_app/screens/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/screens/splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';
void main() {
  runApp(Temp());
}

class Temp extends StatelessWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen()
        );
  }
}