import 'package:flutter/material.dart';
import 'package:mealsapp/mealslist.dart';
import './models/dummy_data.dart';
import 'meal.dart';

class Mealsscreen extends StatelessWidget {
  //const Mealsscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments;
    final catid = DUMMY_CATEGORIES[routeArgs as int].id;
    List<Meal> meals_list = DUMMY_MEALS.where((meals) {
      for (var id in meals.categories) {
        if (id == catid) return true;
      }
      return false;

      //return meals.categories.contains(catid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(DUMMY_CATEGORIES[routeArgs as int].title),
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20,bottom: 20),
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
