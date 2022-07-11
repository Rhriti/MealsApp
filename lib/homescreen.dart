import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import 'package:getwidget/getwidget.dart';

class Homescreen extends StatelessWidget {
  //const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
            childAspectRatio: 1.5, mainAxisSpacing: 30,crossAxisSpacing: 20
          ),
          children: List.generate(DUMMY_CATEGORIES.length, (index) {
            return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              //margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
                  image: DUMMY_CATEGORIES[index].image ,fit: BoxFit.fitWidth,opacity: 30
              )
              ),
              child: Text(DUMMY_CATEGORIES[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              );
          })),
    );
  }
}
