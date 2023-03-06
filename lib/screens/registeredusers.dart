import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Registeredusers extends StatefulWidget{
  const Registeredusers({Key? key}): super(key: key);
  @override
  State<Registeredusers> createState() => _Registeredusers();
}

Widget card (String name, String venue,int regcount, BuildContext context){
  return Card(
    //margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
    elevation: 8,
    shadowColor: HexColor("BEB7A4"),

    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color:HexColor("002845"),width: 3)
    ),
    // child: Column(
    //   children: [
    //     Row(
    //       children: [
    //         SizedBox(width: 16,height: 64,),
    //         Text(name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
    //         SizedBox(width: 70,),
    //         new Spacer(),
    //         Icon(Icons.person,),
    //         SizedBox(width: 8,),
    //         Text(regcount.toString()),
    //         SizedBox(width: 16)
    //       ],
    //     ),
    //     SizedBox(height: 16,),
    //     Row(
    //       children: [
    //         SizedBox(width: 16,),
    //         Icon(Icons.date_range,),
    //         SizedBox(width: 8,),
    //         Text("1-3-23"),
    //         SizedBox(width: 100,),
    //         Icon(Icons.access_time_outlined,),
    //         SizedBox(width: 8,),
    //         Text("12:00 PM")
    //       ],
    //     ),
    //     SizedBox(height: 16,),
    //     Row(
    //       children: [
    //         SizedBox(width: 16,),
    //         Icon(Icons.location_pin,color: HexColor("FF3F00"),),
    //         SizedBox(width: 8,),
    //         Text(venue)
    //       ],
    //     ),
    //     SizedBox(height: 40,)
    //
    //   ],
    // ),
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
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0
                    ),
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