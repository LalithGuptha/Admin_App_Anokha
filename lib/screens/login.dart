import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  TextEditingController uncontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();

  Widget build(BuildContext context){

    return MaterialApp(
      title: "Login Screen",
      home: Scaffold(
        body: SingleChildScrollView(
          child:Column(
            children: [
              Container(
                child: Text("Welcome"),
              )
            ],
          )
        ),
      ),
    );
  }

}