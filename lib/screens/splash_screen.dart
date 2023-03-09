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

  late AnimationController controller;
  late Animation sizeAnimation;
  double customOpacity=0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    sizeAnimation = Tween<double>(begin: 200.0, end: 350.0,).animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));
    controller.forward();
    controller.addListener(() {
      setState(() {
        customOpacity=1;
      });
    });
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(

          MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: sizeAnimation.value,
                width: sizeAnimation.value,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/anokha_2023_black_small.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48,),
              // AnimatedOpacity(opacity: customOpacity, duration: Duration(seconds: 2),
              //   child:Text("Anokha",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700),) ,)
            ],
          )
        )
      )
    );
    }
}