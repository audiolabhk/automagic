import 'package:auto_magic/Car.dart';
import 'package:auto_magic/Detail.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  String _title = "AutoMagic!";
  Color _color = Colors.blueAccent;
  int _rnd = 0;
  int _score = 0;

  Widget _snackbar(String _content, String _label, _action()) {
    return SnackBar(
        content: Text(_content),
        action: SnackBarAction(
          label: _label,
          onPressed: () => _action(),
        ),
        duration: Duration(seconds: 2));
  }

  @override
  void initState() {
    int rnd = Random().nextInt(3);
    _title = 'Which is the ' + cars[rnd].name.toUpperCase() + '?';
    super.initState();
  }

  void _refresh() {
    _rnd = Random().nextInt(3);
    setState(() {
      // _color = Colors.white;
      cars.shuffle();
      _title = 'Which is the ' + cars[_rnd].name.toUpperCase() + '?';
    });
  }

  void _handleTap(index) {
    bool correct = _rnd == index ? true : false;
    Widget sn = !correct
        ? _snackbar('WRONG YOU IDIOT', 'Try Again', null)
        : _snackbar('Score: $_score', 'Keep Going!', null);
    Scaffold.of(context).showSnackBar(sn);

    setState(() {
      correct ? _score++ : _score--;
      _color = correct ? Colors.green : Colors.red;
    });
    print(_score.toInt());
    _refresh();
  }

  void _reset() {
    sbaction() {
      setState(() {
        _score = 0;
      });
    }
    Scaffold.of(context)
        .showSnackBar(_snackbar('Reset Score?', 'RESET', sbaction));
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(_title),
          Text('Score: '+ _score.toString())
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        child: Icon(Icons.refresh),
        onPressed: () => _reset(),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: _height / 4,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                color: _color,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 50,
                  child: ListTile(
                      title: Image.asset(cars[index].image),
                      leading: IconButton(
                          color: Colors.pink,
                          icon: Icon(Icons.info),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailView(cars[index])))),
                      onTap: () => _handleTap(index)),
                ),
              ),
            );
          }),
    );
  }
}
