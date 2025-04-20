import 'package:flutter/material.dart';

void main() => runApp(ProfileCardApp());

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(child: ProfileCard()),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            SizedBox(height: 15),
            Text(
              'Alex Johnson',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Flutter Developer • UI Enthusiast',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.person_add),
                  label: Text('Follow'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    // Follow action
                  },
                ),
                SizedBox(width: 10),
                OutlinedButton.icon(
                  icon: Icon(Icons.message),
                  label: Text('Message'),
                  style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    // Message action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
