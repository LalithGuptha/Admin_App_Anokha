import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Manageevent extends StatefulWidget{
  const Manageevent({Key? key}): super(key: key);
  @override
  State<Manageevent> createState() => _Manageevent();
}

Widget card (String name, String venue,int regcount, BuildContext context){
  return Card(
    margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
    elevation: 8,
    shadowColor: HexColor("BEB7A4"),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      //side: BorderSide(width: 3)
    ),
    child: Container(
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 80,
            child: ClipRRect(
              child: Image.asset('assets/ml.jpg',fit: BoxFit.fill,),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          SizedBox(width: 8,),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children:[
                      Text("Sat, Apr 1",),
                      SizedBox(width:40 ,),
                      Text("12:00 PM")
                    ]
                ),
                SizedBox(height: 10,),
                Text(name,style: TextStyle(fontSize:24,fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.location_pin,color: HexColor("FF3F00"),),
                    SizedBox(width: 8,),
                    Text(venue)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
  );
}
class _Manageevent extends State<Manageevent>
{
  var name=["ML Workshop","CTF","Hackathon"];
  var venue=["AB1","AB2","AB3"];
  var regcount=[10,20,30];
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
          child: Text("Created Events",style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: HexColor("FF3F00")
          ),
            textAlign: TextAlign.center,
          ) ,),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index){
                  return card(name[index], venue[index], regcount[index], context);
                }),
          )
        ],
      )

    ),
    );
}
}