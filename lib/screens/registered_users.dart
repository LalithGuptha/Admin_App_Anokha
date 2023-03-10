import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Registeredusers extends StatefulWidget{
  const Registeredusers({Key? key}): super(key: key);
  @override
  State<Registeredusers> createState() => _Registeredusers();
}

Widget card (list,bool rr, BuildContext context){
  return GestureDetector(
    child: Card(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
      elevation: 8,
      shadowColor: HexColor("BEB7A4"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        margin: EdgeInsets.all(24),
        child: Row(
          children: [
            SizedBox(width: 16,),
            Column(
              children: [
                SizedBox(height: 10,),
                Text(list["name"],style: TextStyle(color: Colors.black,fontSize: 24)),
                SizedBox(height: 10,),
              ],
            ),
            SizedBox(width: 54,),
            Text(list["userId"].toString(),style: TextStyle(color: Colors.black,)),
            Spacer(),
            Visibility(
                visible: rr,
                child:IconButton(onPressed: (){}, icon: Icon(Icons.payments_outlined))
            ),
            SizedBox(width: 16,)

          ],
        ),
      )
    ),
  );
}
class _Registeredusers extends State<Registeredusers>
{
  // var name=["ML workshop","CTF","Hackathon","Singing","Code-a-thon"];
  // var venue=["AB1","AB2","AB3","AB2","AB1"];
  // var regcount=[10,20,30,40,20];
  Future<List> getData() async {
    final response = await http.get(
        Uri.parse("http://18.183.52.0:3060/api/users/all"));

    return json.decode(response.body);
  }
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
          body:FutureBuilder<List>(
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
          child: Text("Registered Users", style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: HexColor("FF3F00")
          ),
            textAlign: TextAlign.center,
          ),),
        SizedBox(height: 40,),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.list == null ? 0 : widget.list!.length,
              itemBuilder: (BuildContext context, i) {
                return card(widget.list![i],true, context);
              }),
        )
      ],
    );
  }

}