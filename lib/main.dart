import 'package:flutter/material.dart';
import 'homescreen.dart';
import './mealsscreen.dart';
import 'recepiescreen.dart';
import 'navigatiobar.dart';
import 'filterscreen.dart';
import 'meal.dart';
import './models/dummy_data.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  //Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Map<String, bool> change = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  var dummymeals=DUMMY_MEALS;

  void filters(List sts) {
    setState(() {
      change['isGlutenFree'] = sts[2];
      change['isVegan'] = sts[0];
      change['isVegetarian'] = sts[3];
      change['isLactoseFree'] = sts[1];

      dummymeals = DUMMY_MEALS.where((meal) {
        if (change['isGlutenFree'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (change['isLactoseFree'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (change['isVegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (change['isVegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
    //print(List.generate(dummymeals.length, (index) =>dummymeals[index].isGlutenFree));
    print(change);
    print(dummymeals);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: Home(),
        title: 'Meals app',
        // app chalu is screen se hoga ie homescreen se
        initialRoute: '/',
        routes: {
          '/myapp': (_) => Myapp(),
          '/filterscreen': (_) => Filterscreen(filters),
          '/homes': (_) => Homescreen(),
          '/meals_detail': (ctx) => Mealsscreen(dummymeals),
          '/recepie': (_) => Recepie(),
          '/': (_) => Navigationbar()
        });
  }
}
