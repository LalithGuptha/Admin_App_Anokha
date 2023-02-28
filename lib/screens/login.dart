import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
                margin: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 40),
                      child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/logo.png'),
                    ),),
                    SizedBox(height: 80,),

                    TextField(
                      controller: uncontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                        labelText: "Username",
                        hintText: "Username"
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: uncontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          labelText: "Password",
                          hintText: "Password"
                      ),
                    ),
                    SizedBox(height: 32,),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Login",style: TextStyle(
                            fontSize: 16
                        ),),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("FF7F11"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 56),
                    child: Text("Not a registered user?",style: TextStyle(
                        fontSize: 18
                    ),)
                    ),
                    SizedBox(height: 24,),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Register",style: TextStyle(
                            fontSize: 16
                        ),),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("FF7F11"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              )
            ],
          )
        ),
      ),
    );
  }

}