import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import 'package:getwidget/getwidget.dart';
import './categorylist.dart';
import 'meal.dart';

class Homescreen extends StatefulWidget {

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //const Homescreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
                childAspectRatio: 1.5,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20),
            children: Categorylist(context).func(),
          ),
        ),
      ),
    );
  }
}
