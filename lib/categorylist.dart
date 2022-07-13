import 'package:flutter/material.dart';
import 'category.dart';
import './models/dummy_data.dart';
import 'mealsscreen.dart';

class Categorylist {
  BuildContext context;
  Categorylist(this.context);

  void navigate(BuildContext ctx, int index) {
    Navigator.of(context).pushNamed('/meals_detail',arguments: index );
  }

  List<Widget> func() => List.generate(DUMMY_CATEGORIES.length, (index) {
        return InkWell(
          onTap: () => navigate(context, index),
          borderRadius: BorderRadius.circular(30),
          splashColor: Colors.amber,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            //margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.dstATop),
                    image: DUMMY_CATEGORIES[index].image,
                    fit: BoxFit.fitWidth,
                    opacity: 30)),
            child: Text(
              DUMMY_CATEGORIES[index].title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        );
      });
}
