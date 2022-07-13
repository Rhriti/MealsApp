
import 'package:flutter/material.dart';
import 'homescreen.dart';
import './mealsscreen.dart';


void main() => runApp(MaterialApp(
    home: Home(),
    title: 'Meals app',
    darkTheme: ThemeData(brightness: Brightness.dark),
    themeMode: ThemeMode.dark,
     // app chalu is screen se hoga ie homescreen se 
    routes: { '/meals_detail': (ctx) => Mealsscreen(),}));

class Home extends StatefulWidget {
  //Meals({Key? key}) : super(key: key);
  @override
   State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Homescreen(),
      appBar: AppBar(
        title: Text('Meals Mela'),
      ),
    );
  }
}
