
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/models/dummy_data.dart';
import 'meal.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Mealslist extends StatelessWidget {
  //const Mealslist({Key? key}) : super(key: key);
  final List<Meal> mealslist;
  final int index;
  Mealslist(this.mealslist, this.index);

  String? comp(Complexity c) {
    switch (c) {
      case (Complexity.Simple):
        {
          return 'Simple';
        }
        break;

      case (Complexity.Hard):
        {
          return 'Hard';
        }
        break;
      case (Complexity.Challenging):
        {
          return 'Challenging';
        }
        break;
      default:
        return '_____';
    }
  }

  String? afford(Affordability af) {
    switch (af) {
      case (Affordability.Affordable):
        {
          return 'Affordable';
        }
        break;

      case (Affordability.Luxurious):
        {
          return 'Luxurious';
        }
        break;
      case (Affordability.Pricey):
        {
          return 'Pricey';
        }
        break;
      default:
        return '_____';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          height: 200,
          width: double.infinity,
          // child: Image(
          //   image: NetworkImage(mealslist[index].imageUrl),
          //   height: 200,
          //   fit: BoxFit.fitWidth,
          // )
          child: Image.network(mealslist[index].imageUrl,
              height: 200, fit: BoxFit.fitWidth,
              loadingBuilder: (ctx, Widget child, loadingprogress) {
            if (loadingprogress == null) {
              return child;
            }
            return LoadingAnimationWidget.flickr(leftDotColor: Colors.amber, rightDotColor: Colors.pink, size: 40);
          })),
      Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Icon(Icons.timer_outlined),
                SizedBox(
                  width: 5,
                ),
                Text(mealslist[index].duration.toString()),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(comp(mealslist[index].complexity) as String),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.currency_rupee),
                Text(afford(mealslist[index].affordability) as String),
              ],
            )
          ])
    ]);
  }
}
