import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: "backend testing",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response =
    await http.get(Uri.parse("http://192.168.193.228:3000/api/events/all"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("backend testing")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class Items extends StatelessWidget {
  List? list;
  Items({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(list![i]["name"]),
            subtitle: Text(list![i]["description"]),
          );
          });
    }
}