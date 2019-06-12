import 'package:flutter/material.dart';

class PV extends StatefulWidget {
  @override
  _PVState createState() => _PVState();
}

class _PVState extends State<PV> {
  final pc = PageController(initialPage: 0,keepPage: true);

  @override
  Widget build(BuildContext context) {
    return PageView(controller: pc,
    children: <Widget>[
      
    ],
      
    );
  }
}