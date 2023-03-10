import 'package:admin_app/screens/HomeScreen/home_screen.dart';
import 'package:admin_app/screens/Signup.dart';
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
  final _formkey = GlobalKey<FormState>();

  Widget build(BuildContext context){

    return MaterialApp(
      title: "Login Screen",
      home: Scaffold(
        body: SingleChildScrollView(
          child:Column(
            children: [
              Container(
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                  color: HexColor("002845"),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64),bottomRight: Radius.circular(64)),
    ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Image.asset('assets/logo.png'),
                  ),
    ),
              Container(
                margin: EdgeInsets.all(40),
                child: Form(
                  key: _formkey,
                 child: Column(
                   children: [
                     //SizedBox(height: 40,),
                     TextFormField(
                       validator: (value){
                         if (value==null || value.isEmpty)
                           {
                             return "Enter a Username";
                           }
                       },
                       controller: uncontroller,
                       decoration: InputDecoration(
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(16)),
                           labelText: "Username",
                           hintText: "Username"
                       ),
                     ),
                     SizedBox(height: 40),
                     TextFormField(
                       validator: (value){
                         if (value == null || value.isEmpty)
                           {
                                return 'Enter a password';
                           }
                       },
                       controller: pcontroller,
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
                         onPressed: (){

                           if (_formkey.currentState!.validate()){
                             Navigator.of(context).pushReplacement(

                                 MaterialPageRoute(builder: (context) => HomeScreen()));
                           }
                         },
                         child: Text("Login",style: TextStyle(
                             fontSize: 16
                         ),),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: HexColor("FF7F11"),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(16))
                           ),
                         ),
                       ),
                     ),
                     // Padding(
                     //     padding: EdgeInsets.only(top: 52),
                     // child: Text("Not a registered user?",style: TextStyle(
                     //     fontSize: 18
                     // ),)
                     // ),
                     // SizedBox(height: 24,),
                     // SizedBox(
                     //   height: 50,
                     //   width: 160,
                     //   child: ElevatedButton(
                     //     onPressed: (){
                     //       Navigator.push(context,
                     //       MaterialPageRoute(builder: (context) => const Signup()));
                     //     },
                     //     child: Text("Register",style: TextStyle(
                     //         fontSize: 16
                     //     ),),
                     //     style: ElevatedButton.styleFrom(
                     //       backgroundColor: HexColor("FF7F11"),
                     //       shape: RoundedRectangleBorder(
                     //           borderRadius: BorderRadius.all(Radius.circular(16))
                     //       ),
                     //     ),
                     //   ),
                     // ),
                   ],

                 ),
                )
              )
            ],
          )
        ),
      ),
    );
  }

}