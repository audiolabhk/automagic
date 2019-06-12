import 'package:auto_magic/Garage.dart';
import 'package:auto_magic/Play.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:FlatButton(child: Text('Get Started!'), onPressed: ()=> setState(() {
              _opacity = 1.0;
            }),),),
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 2000),
        opacity: _opacity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(child: Text("Play"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Play()),)),
              FlatButton(child: Text("Learn"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Garage()),)),

              ],
          ),
        ),
      ),
    );
  }
}
