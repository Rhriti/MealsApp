import 'package:flutter/material.dart';
import 'homescreen.dart';
void main() => runApp(MaterialApp(
      home: Meals(),
      title: 'Meals app',
    ));

class Meals extends StatefulWidget {
  //Meals({Key? key}) : super(key: key);
  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Homescreen(),appBar: AppBar(title: Text('Meals Mela'),),);
  }
}