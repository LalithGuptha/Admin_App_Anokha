import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup>
{
    var departments = ["AEE","AIE","ARE","CCE","CHE","CIE","CVI","CSE","CYS","EAC","ECE","EEE","EIE","ELC","MEE"];
    String dropdownvalue = 'CSE';
    final blue="002845";
    final white="FFFFFC";
    final grey="BEB7A4";
    final orange="FF7F11";
    final red="FF3F00";
    @override
    Widget build(BuildContext context)
    {
      return MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            backgroundColor: HexColor(blue),
            leading: IconButton(
              onPressed:(){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),),
          ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text("Signup",style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: HexColor(orange)
                ),
                  textAlign: TextAlign.center,
                ) ,
              ),
              SizedBox(height: 8,),
              Padding(
                  padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            labelText: "Email Id",
                            hintText: "anokha@gmail.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))
                        )

                    ),
                    SizedBox(height: 40,),
                    TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            labelText: "Password",
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))
                        )

                    ),
                    SizedBox(height:40),
                    TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.repeat_one),
                            labelText: "Re-enter Password",
                            hintText: "Re-enter Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))
                        )

                    ),
                    SizedBox(height:40),
                    TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Full Name",
                            hintText: "Full Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))
                        )

                    ),
                    SizedBox(height:32),
                    Row(
                      children: [
                        SizedBox(width: 40,),
                        Text("Department",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                        ),),
                        SizedBox(width: 40,),
                        DropdownButton(
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: HexColor(orange),
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: departments.map((String departments){
                              return DropdownMenuItem(value: departments,
                                child: Text(departments),);
                            }).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            }

                        ),
                      ],
                    ),
                    SizedBox(height:32),
                    TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone_android),
                            labelText: "Contact",
                            hintText: "+91",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))
                        )

                    ),
                    SizedBox(height: 24,),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: (){
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => const Signup()));
                        },
                        child: Text("Register",style: TextStyle(
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
                  ],
                ),
              )
            ],
          ),
        ),
        ),
      );
    }
}