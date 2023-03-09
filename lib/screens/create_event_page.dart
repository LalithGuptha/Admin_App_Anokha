import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'listofevents.dart';

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
        body: SingleChildScrollView(
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
                            });
                          },
                        ),
                        const Text('Paid Event'),
                      ],
                    ),
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
        ),
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
