import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = 'John Doe';
  String _email = 'johndoe@example.com';
  String _department = 'Engineering';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _username,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _email,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Department',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _department,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement change password functionality
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement logout functionality
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
