import 'package:flutter/material.dart';
// import 'Car.dart';
import 'dart:math' as math;

class DetailView extends StatelessWidget {
  final myCar;
  DetailView(this.myCar);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(
            myCar.name.toUpperCase(),
            textAlign: TextAlign.center,
          ),
          backgroundColor:
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                  .withOpacity(1.0),
        ),
        body: Hero(tag: myCar.name,
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                myCar.image,
                width: MediaQuery.of(context).size.width,
              ),
              Card(
                elevation: 50,
                child: Text(
                  'Adipisicing sunt do incididunt ipsum est mollit aliquip commodo duis fugiat culpa ut quis velit. Aute sint duis cupidatat excepteur fugiat ea irure dolore ex in proident do. Anim nulla eiusmod irure ea officia ea cupidatat. Laborum reprehenderit aliquip excepteur deserunt elit amet dolor elit.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
  }
}
