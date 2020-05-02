import 'package:carousel_slider/carousel_slider.dart';
import 'package:f_web/try/griddashboard.dart';
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
  List<String> lt = new List();
  CarouselSlider slide;

  @override
  void initState() {
    super.initState();
    lt.add('images/slide1.png');
    lt.add('images/slide2.png');
    lt.add('images/slide3.png');
    lt.add('images/slide1.png');
    lt.add('images/slide2.png');
    lt.add('images/slide3.png');
  }

  @override
  Widget build(BuildContext context) {
    slide = new CarouselSlider(
      items: lt.map((name) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: FittedBox(child: Image.asset(name), fit: BoxFit.contain),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: (MediaQuery.of(context).size.width >= 800
            ? MediaQuery.of(context).size.height * .5
            : MediaQuery.of(context).size.height * .25),
        //aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.linear,
        //pauseAutoPlayOnTouch: Duration(seconds: 10),
        enlargeCenterPage: true,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MoneyTrack()));
            },
          ),
          IconButton(
            icon: Icon(Icons.chrome_reader_mode),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsHome()));
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsHome()));
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Track Money"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MoneyTrack()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsHome()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.width * .015,
                  0,
                  MediaQuery.of(context).size.width * .015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[slide],
              ),
            ),

            
            GridDashboard(),
            //There can be more hil with flx 1
          ],
        ),
      ),
    );
  }
}
