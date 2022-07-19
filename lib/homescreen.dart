import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import 'package:getwidget/getwidget.dart';
import './categorylist.dart';


class Homescreen extends StatelessWidget {
  //const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Meals Mela')),
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
    );
  }
}
