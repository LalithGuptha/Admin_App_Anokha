import 'package:admin_app/screens/login.dart';
import 'package:flutter/material.dart';

class userProf extends StatefulWidget {
  const userProf({Key? key}) : super(key: key);

  @override
  State<userProf> createState() => _userProfState();
}

class _userProfState extends State<userProf> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor:  Color(0xFFFFFFFC),
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                color: Color(0xFFFFFFFC),
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xFFFFFFFC),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFF002845),
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.power_settings_new),
              color: Color(0xFFFF3F00),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.006, left: MediaQuery.of(context).size.width * 0.09, right: MediaQuery.of(context).size.width * 0.09, bottom: MediaQuery.of(context).size.height * 0.05),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1,bottom:MediaQuery.of(context).size.height * 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color:Color(0xFF002845),
                      ),
                      // color: Colors.black,
                    ),
                    Positioned(
                        left: MediaQuery.of(context).size.width * -0.095,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color:  Color(0xFFFFFFFC),
                              shape: BoxShape.circle),
                        )),
                    Positioned(
                      right: MediaQuery.of(context).size.width * -0.095,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color:
                             Color(0xFFFFFFFC),
                            shape: BoxShape.circle),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      child: Container(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: Column(
                            children: [
                              // Text("hey"), for logo
                              Expanded(
                                  flex: 1,
                                  child: Image.asset('assets/anokha_2023_white_v2.png',width: 300,)),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.028,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color:
                                          Color(0xFFFFFFFC),
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Admin Id",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color:
                                      Color(0xFFFFFFFC),
                                      fontFamily: 'Roboto'),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
