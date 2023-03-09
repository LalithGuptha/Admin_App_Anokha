import 'package:admin_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = 'Lallu';
  String _email = 'lallu@example.com';
  String _department = 'CSE';
  final blue="002845";
  final white="FFFFFC";
  final grey="BEB7A4";
  final orange="FF7F11";
  final red="FF3F00";
  var isEdit=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: HexColor(blue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isEdit=true;
                });
              },
              child: Row(
                children: [
                  Text(
                    _username,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  IconButton(onPressed:(){
                    setState(() {
                      isEdit=true;
                    });
                  }, icon: Icon(Icons.edit)),
                ],
              ),
            ),
            if (isEdit)
              TextFormField(
                initialValue: _username,
                onChanged: (value){
                  setState(() {
                    _username=value;
                  });
                },
              ),


            const SizedBox(height: 16.0),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _email,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Department',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _department,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: change password functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor(orange),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
              child: const Text('Change Password',style: TextStyle(fontSize: 16),),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor(orange),
                shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
              child: const Text('Logout',style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 60,),
            Container(
              margin: const EdgeInsets.only(left: 80),
              child:Lottie.asset(
                'assets/animations/9404-lotus-animation.json',
                fit: BoxFit.contain,)
              ),
          ],
        ),
      ),
    );
  }
}
