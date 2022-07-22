import 'package:flutter/material.dart';
import 'package:mealsapp/homescreen.dart';
import 'package:mealsapp/mealslist.dart';
import './models/dummy_data.dart';
import 'meal.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Mealsscreen extends StatefulWidget {
  List<Meal> dummymeal;
  Mealsscreen(this.dummymeal);
  @override
  State<Mealsscreen> createState() => _MealsscreenState();
}

class _MealsscreenState extends State<Mealsscreen> {
  //const Mealsscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as int;
    //final sts = ModalRoute.of(context)!.settings.arguments as List;
    //print(routeArgs);
    final catid = DUMMY_CATEGORIES[routeArgs as int].id;
    List<Meal> meals_list = widget.dummymeal.where((meals) {
      for (var id in meals.categories) {
        if (id == catid) return true;
      }
      return false;
      //return meals.categories.contains(catid);
    }).toList();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomLeft,
          begin: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 141, 141, 246),
            Color.fromARGB(255, 34, 36, 37)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: Text(DUMMY_CATEGORIES[routeArgs as int].title),
        // ),
        appBar: NewGradientAppBar(
          centerTitle: true,
          title: Text(DUMMY_CATEGORIES[routeArgs as int].title),
          gradient: LinearGradient(
            end: Alignment.bottomLeft,
            begin: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 141, 141, 246),
              Color.fromARGB(255, 34, 36, 37)
            ],
          ),
        ),
        body: Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
            child: ListView.separated(
              separatorBuilder: (_, index) {
                return SizedBox(height: 15);
              },
              itemCount: (meals_list != null) ? meals_list.length : 0,
              itemBuilder: (ctx, index) {
                meals_list[index].delete = false;
                return Mealslist(meals_list, index);
              },
            )),
      ),
    );
  }
}
