
import 'package:flutter/material.dart';
import 'homescreen.dart';
import './mealsscreen.dart';
import 'recepiescreen.dart';
import 'navigatiobar.dart';

void main() => runApp(MaterialApp(
    //home: Home(),
    title: 'Meals app',
    darkTheme: ThemeData(brightness: Brightness.dark),
    themeMode: ThemeMode.dark,
     // app chalu is screen se hoga ie homescreen se 
     initialRoute: '/',
    routes: { '/meals_detail': (ctx) => Mealsscreen(),'/recepie':(_)=>Recepie(),'/':(_)=>Navigationbar()}));

