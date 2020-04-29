import 'package:flutter/material.dart';
import 'package:f_web/about_us.dart';
import 'package:f_web/money_track.dart';
import 'package:f_web/contact_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NSRMT | HeyCode Inc.",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Shree Ram Money Transfer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            autofocus: true,
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
                      "https://scontent.fbir1-1.fna.fbcdn.net/v/t31.0-8/p960x960/19467918_1408747009204869_6478468540734149116_o.png?_nc_cat=100&_nc_sid=85a577&_nc_ohc=2q8Rlr5RBqwAX_m-M5t&_nc_ht=scontent.fbir1-1.fna&oh=7b8af8a2214a598dbbddd360f732db3d&oe=5ECE8152")),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
              enabled: false,
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
              leading: Icon(Icons.chrome_reader_mode),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Contact Us'),
              onTap: () {
                 Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsHome()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.redAccent,
        padding: EdgeInsets.all(20),
        child: Image.asset('images/banner.jpg', width: double.infinity,),
      ),
    );
  }
}
