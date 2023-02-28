import 'package:flutter/material.dart';
import 'package:admin_app/screens/splash_screen.dart';

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