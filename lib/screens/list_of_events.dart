import 'package:admin_app/screens/home_screen.dart';
import 'package:admin_app/screens/registered_users.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'create_event_page.dart';

class Manageevent extends StatefulWidget{
  const Manageevent({Key? key}): super(key: key);
  @override
  State<Manageevent> createState() => _Manageevent();
}

Widget card (list, BuildContext context){
  String date = list["date"];
  final blue="002845";
  final white="FFFFFC";
  final grey="BEB7A4";
  final orange="FF7F11";
  final red="FF3F00";
  return GestureDetector(
    onTap:(){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              alignment: Alignment.center,
              title: Center(child: Text(list["name"])),
              content: Text(list["description"]),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [

                ElevatedButton(
                  onPressed: () {},
                  child: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor(blue),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Registeredusers()));
                  },
                  child: Text('Registered Users'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor(blue),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      );

    },
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      elevation: 8,
      shadowColor: HexColor("BEB7A4"),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        //side: BorderSide(width: 3)
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 80,
              child: ClipRRect(
                child: Lottie.asset('assets/animations/ai.json'),
                //borderRadius: BorderRadius.all(Radius.circular(16)),
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
                        Text(date.split('T')[0],),
                        SizedBox(width:40 ,),
                        //Text(list["startTime"])
                      ]
                  ),
                  SizedBox(height: 10,),
                  Text(list["name"],style: TextStyle(fontSize:24,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.location_pin,color: HexColor("FF3F00"),),
                      SizedBox(width: 8,),
                      Text(list["venue"])
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ),
  );
}
class _Manageevent extends State<Manageevent> {
  //var name=["ML Workshop","CTF","Hackathon"];
  //var venue=["AB1","AB2","AB3"];
  //var regcount=[10,20,30];
  Future<List> getData() async {
    final response = await http.get(
        Uri.parse("http://18.183.52.0:3060/api/events/all"));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("002845"),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: Icon(Icons.arrow_back),),
        ),
        body: FutureBuilder<List>(
            future: getData(),
            builder: (context, ss) {
              if (ss.hasError) {
                print("error");
              }
              if (ss.hasData) {
                return Items(list: ss.data);
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            }),

      ),
    );
  }
}

class Items extends StatefulWidget{
    List? list;
    Items({Key? key,required this.list}): super(key: key);
    @override
    State<Items> createState() => _Items();
    }

class _Items extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Text("Created Events", style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: HexColor("FF3F00")
          ),
            textAlign: TextAlign.center,
          ),),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.list == null ? 0 : widget.list!.length,
              itemBuilder: (BuildContext context, i) {
                return card(widget.list![i], context);
              }),
        )
      ],
    );
  }

}
