import 'package:auto_magic/Detail.dart';
import 'package:flutter/material.dart';
import 'Car.dart';

class Garage extends StatefulWidget {
  @override
  _GarageState createState() => _GarageState();
}

class _GarageState extends State<Garage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height / cars.length - 4,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            color: index % 2 == 0 ? Colors.indigo[100] : Colors.red[100],
            child: ListTile(
              onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailView(cars[index]))),
              leading: Hero(
                tag: cars[index].name,
                child: Image.asset(
                  cars[index].image)),
              title: Text(cars[index].name.toUpperCase()),
              trailing: IconButton(
                  icon: Icon(
                    Icons.save,
                    color: Colors.orange,
                  ),
                  onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Saved'),
                        action: SnackBarAction(
                            label: 'Undo', onPressed: () => print("Undone!")),
                        duration: Duration(seconds: 1),
                      ))),
            ),
          ),
        );
      },
    );
  }
}
