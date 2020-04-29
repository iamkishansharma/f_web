import 'package:flutter/material.dart';
import 'main.dart';
import 'about_us.dart';
import 'money_track.dart';

void main() => runApp(ContactUs());

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSRMT | HeyCode Inc.',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ContactUsHome(),
    );
  }
}

class ContactUsHome extends StatefulWidget {
  @override
  _ContactUsHomeState createState() => _ContactUsHomeState();
}

class _ContactUsHomeState extends State<ContactUsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "New Shree Ram Money Transfer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MoneyTrack()));
            },
          ),
          IconButton(
            icon: Icon(Icons.chrome_reader_mode),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsHome()));
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            autofocus: true,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsHome()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/36340195?s=400&u=64b04f014537e82e746eebc1366a76d476a87069&v=4")),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Track Money"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => MoneyTrack()));
              },
            ),
            ListTile(
              leading: Icon(Icons.format_line_spacing),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Contact Us'),
              enabled: false,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsHome()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.purpleAccent,
        child: Center(
          child: Text(
            "Contact Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height*.05,
            ),
          ),
        ),
      ),
    );
  }
}