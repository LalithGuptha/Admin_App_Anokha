import 'dart:async';
import 'dart:convert';
import 'package:admin_app/screens/list_of_events.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:hexcolor/hexcolor.dart';

Future<Album> fetchAlbum() async{
  final response = await http.get(Uri.parse('http://18.183.52.0:3060/api/events/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    Uri.parse('http://18.183.52.0:3060/api/events/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
// parsing JSOn or throwing an exception
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}

class Album {
  final int eventId;
  final String name;
  final String description;
  final DateTime date;
  final String venue;
  final String startTime;
  final String endTime;


  Album({required this.eventId, required this.name,required this.description, required this.date, required this.venue, required this.startTime,required this.endTime});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      eventId: json['eventId'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
      venue: json['venue'],
      startTime: json['startTime'],
      endTime: json['endTime']
    );
  }
}


// create event code

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool _isPaid = false;
  TextEditingController _eventTitleController = TextEditingController();
  TextEditingController _noOfSeatsController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _venueController = TextEditingController();
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();
  bool vis = false;
  late Future<Album> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("002845"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          'Create Event',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: HexColor("FF7F11"),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            TextField(
                              controller: _eventTitleController,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.event),
                                labelText: 'Event Title',
                                hintText: 'Event Title',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            TextField(
                              controller: _noOfSeatsController,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.people_alt),
                                labelText: 'No. of Seats',
                                hintText: 'No. of Seats',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 40),
                            TextField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.description),
                                labelText: 'Description/Details',
                                hintText: 'Description/Details',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              maxLines: 5,
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: _startTimeController,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.access_time),
                                      labelText: 'Start Time',
                                      hintText: 'Start Time',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: _endTimeController,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.access_time),
                                      labelText: 'End Time',
                                      hintText: 'End Time',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            TextField(
                              controller: _venueController,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.location_on),
                                labelText: 'Venue',
                                hintText: 'Venue',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Checkbox(
                                  value: _isPaid,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPaid = value!;
                                      vis=!vis;
                                    });
                                  },
                                ),
                                const Text('Paid Event'),
                              ],
                            ),
                            Visibility(
                                visible: vis,
                                child: TextFormField(
                                  validator: (value){
                                    if (value == null || value.isEmpty)
                                    {
                                      return 'Enter a password';
                                    }
                                  },
                                  inputFormatters:[
                                    CurrencyTextInputFormatter(
                                      decimalDigits: 0,
                                      symbol:'₹',
                                    ),],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hoverColor: HexColor("FF7F11"),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16)),
                                      labelText: "Fee",
                                      hintText: "Fee"
                                  ),
                                )),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              onPressed: () {
                                _showEventCreatedDialog(context);
                              },
                              child: const Text(
                                'Create',
                                style: TextStyle(fontSize: 24),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50), backgroundColor: HexColor("FF7F11"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
              }
              }

    return const CircularProgressIndicator();
          },
        )
      ),
    );
  }
  void _showEventCreatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event created successfully'),
          content: Text('Your event has been created successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Manageevent()));
              },
              child: Text('View Created Events'),
            ),
          ],
        );
      },
    );
  }
}

