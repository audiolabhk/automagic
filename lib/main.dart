import 'package:auto_magic/Garage.dart';
// import 'package:auto_magic/Landing.dart';
import 'package:auto_magic/Play.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController _pc = PageController(initialPage: 0);
  int _navIndex = 0;
  void _navTap(index) {
    setState(() {
      _pc.animateToPage(index,duration: Duration(milliseconds: 200), curve: Curves.ease);
      _navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AutoMagic',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _navIndex,
              onTap: (index) => _navTap(index),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow), title: Text("Play")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_searching),
                    title: Text("Garage")),
              ],
            ),
            body: PageView(
              controller: _pc,
              children: <Widget>[Play(), Garage()],
              // pageSnapping: true,
              onPageChanged: (index) {
                setState(() {
                  _navIndex = index;
                });
              },
            )));
  }
}
