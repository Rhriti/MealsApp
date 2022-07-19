import 'package:flutter/material.dart';
import 'package:mealsapp/mealslist.dart';
import './models/dummy_data.dart';
import 'meal.dart';

class Mealsscreen extends StatefulWidget {
  @override
  State<Mealsscreen> createState() => _MealsscreenState();
}

class _MealsscreenState extends State<Mealsscreen> {
  //const Mealsscreen({Key? key}) : super(key: key);
  var routeArgs; //int
  late List<Meal> meals_list;

  @override
  void initState() {
    super.initState();
    routeArgs = ModalRoute.of(context)!.settings.arguments as int;
    final catid = DUMMY_CATEGORIES[routeArgs as int].id;
    List<Meal> meals_list = DUMMY_MEALS.where((meals) {
      for (var id in meals.categories) {
        if (id == catid) return true;
      }
      return false;
      //return meals.categories.contains(catid);
    }).toList();
  }

  void deltemeals() {
    setState(() {
      meals_list.removeWhere((element) => element.id == Mealslist.mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DUMMY_CATEGORIES[routeArgs as int].title),
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
          child: ListView.separated(
            separatorBuilder: (_, index) {
              return SizedBox(height: 15);
            },
            itemCount: meals_list.length,
            itemBuilder: (ctx, index) {
              return Mealslist(meals_list, index);
            },
          )),
    );
  }
}
