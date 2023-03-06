import 'package:admin_app/screens/listofevents.dart';
import 'package:admin_app/screens/registeredusers.dart';
import 'package:flutter/material.dart';
//import 'package:hexcolor/hexcolor.dart';
import 'package:admin_app/screens/daysCont.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:admin_app/screens/create_event_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  //int _currentIndex = 0;
  final blue="002845";
  final white="FFFFFC";
  final grey="BEB7A4";
  final orange="FF7F11";
  final red="FF3F00";
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final space = const SizedBox(height: 20);
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading:  Icon(
          Icons.menu,
          color: HexColor(blue),
        ),
        title: Text("Anokha 2023",
            style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registeredusers()));
                },
                icon: Icon(Icons.person),
                color: HexColor(blue),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonContainer(),
              space,
              Text("Select the Day and Press the Add button to",style: txtTheme.bodyLarge,),
              space,
              Text("Create an Event",style: txtTheme.headlineLarge,)

            ],
          ),
        ),
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateEvent()));
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 3),
                  Material(
                    child:IconButton(onPressed:(){},icon: Icon(Icons.home,size: 30,))
            ,
                  ),
                  SizedBox(),//to make space for the floating button
                  Material(
                    child: IconButton(onPressed:(){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Manageevent()));
                    },icon: Icon(Icons.event,size: 30,))
                  ),
                  SizedBox(width: 3,)



                ],
              ),
            ),
          ),
    ));
  }
}
