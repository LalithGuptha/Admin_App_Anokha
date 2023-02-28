import 'dart:async';
import 'package:admin_app/screens/login.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(

          MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(height: 32,),
              Align(
                alignment: Alignment.center,
                child:Text("Anokha 2023",textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600),)
                ,
              ),
            ],
          ),
        )

      ),
    );
    }
}