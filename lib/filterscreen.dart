import 'package:flutter/material.dart';
import 'maindrawer.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Filterscreen extends StatefulWidget {
  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  //const Filterscreen({Key? key}) : super(key: key);
  bool st1 = false;
  bool st2 = false;
  bool st3 = false;

  Widget returntile(tits, sec, index) {
    return SwitchListTile(
        title: Text(tits),
        secondary: Text(
          sec,
          style: TextStyle(fontSize: 30),
        ),
        value: index,
        onChanged: (val) {
          index = val;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
        ),
        drawer: Maindrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 141, 141, 246),
                      Color.fromARGB(255, 34, 36, 37)
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 100,
                child: Center(
                  child: Text(
                    'SELECT YOUR ❤ MEALS',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              returntile('Vegan', '🥦',st1),
              returntile('Lactose', '🧀', st2),
              returntile('GLuten', '🍗', st3)
            ],
          ),
        ));
  }
}
