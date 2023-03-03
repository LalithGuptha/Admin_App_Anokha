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
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24)
    ),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(width: 16,height: 64,),
            Text(name,style: TextStyle(fontSize: 24),),
            SizedBox(width: 70,),
            new Spacer(),
            Icon(Icons.person,),
            SizedBox(width: 8,),
            Text(regcount.toString()),
            SizedBox(width: 16)
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            SizedBox(width: 16,),
            Icon(Icons.date_range),
            SizedBox(width: 8,),
            Text("1-3-23"),
            SizedBox(width: 100,),
            Icon(Icons.access_time_outlined,),
            SizedBox(width: 8,),
            Text("12:00 PM")
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            SizedBox(width: 16,),
            Icon(Icons.location_pin),
            SizedBox(width: 8,),
            Text(venue)
          ],
        ),
        SizedBox(height: 40,)

      ],
    ),
  );
}
class _Manageevent extends State<Manageevent>
{
  var name=["ML workshop","CTF","Hackathon"];
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
              color: HexColor("FF7F11")
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