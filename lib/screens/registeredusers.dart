import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Registeredusers extends StatefulWidget{
  const Registeredusers({Key? key}): super(key: key);
  @override
  State<Registeredusers> createState() => _Registeredusers();
}

Widget card (String name, String venue,int regcount, BuildContext context){
  return GestureDetector(
    child: Card(
      //margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
      elevation: 8,
      shadowColor: HexColor("BEB7A4"),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color:HexColor("002845"),width: 3)
      ),

    ),
  );
}
class _Registeredusers extends State<Registeredusers>
{
  var name=["ML workshop","CTF","Hackathon","Singing"];
  var venue=["AB1","AB2","AB3","AB2"];
  var regcount=[10,20,30,40];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
          appBar:AppBar(
            backgroundColor: HexColor("002845"),
            leading: IconButton(
              onPressed:(){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text("Registered Users",style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: HexColor("FF3F00")
                ),
                  textAlign: TextAlign.center,
                ) ,),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.all(16),
                child: Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0
                      ),
                      shrinkWrap: true,
                      itemCount: name.length,
                      itemBuilder: (BuildContext context, int index){
                        return card(name[index], venue[index], regcount[index], context);
                      }),
                ),
              )
            ],
          )

      ),
    );
  }
}