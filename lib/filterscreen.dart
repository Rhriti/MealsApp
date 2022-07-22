import 'package:flutter/material.dart';
import 'package:mealsapp/main.dart';
import 'package:mealsapp/mealsscreen.dart';
import 'maindrawer.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Filterscreen extends StatefulWidget {
  Function filters;
  Filterscreen(this.filters);
  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  //const Filterscreen({Key? key}) : super(key: key);
  List<bool> sts = [false, false, false, false];

  Widget returntile(tits, sec, index) {
    return SwitchListTile(
        title: Text(
          tits,
          style: TextStyle(color: Colors.white),
        ),
        secondary: Text(
          sec,
          style: TextStyle(fontSize: 30),
        ),
        value: sts[index],
        onChanged: (val) {
          setState(() {
            sts[index] = val;
            print('${sts[index]}  $tits');
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 141, 141, 246),
          Color.fromARGB(255, 34, 36, 37)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: NewGradientAppBar(
            title: Text(
              'Filter',
              style: TextStyle(fontSize: 24),
            ),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 141, 141, 246),
              Color.fromARGB(255, 34, 36, 37)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            actions: [
              IconButton(
                  onPressed: () {
                    widget.filters(sts);
                  },
                  icon: Icon(Icons.save)),
              SizedBox(
                width: 30,
              )
            ],
          ),
          drawer: Maindrawer(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'SELECT YOUR ❤ MEALS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                returntile('Vegan', '🥦', 0),
                returntile('Lactose Free', '🧀', 1),
                returntile('Gluten Free', '🍗', 2),
                returntile('Vegetarian', '🍐', 3)
              ],
            ),
          )),
    );
  }
}
