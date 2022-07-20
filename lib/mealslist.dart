import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/mealsscreen.dart';
import 'package:mealsapp/models/dummy_data.dart';
import 'meal.dart';
import 'package:getwidget/getwidget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Mealslist extends StatefulWidget {
  //const Mealslist({Key? key}) : super(key: key);
  final List<Meal> mealslist;
  final int index;
  Mealslist(this.mealslist, this.index);

  @override
  State<Mealslist> createState() => _MealslistState();
}

class _MealslistState extends State<Mealslist> {
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
    return Column(children: (widget.mealslist[widget.index].delete==false)? [
      InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed('/recepie', arguments: widget.mealslist[widget.index])
            .then((value) {
          if (value == 'kill') {
            setState(() {
      widget.mealslist[widget.index].delete = true;
    });
          }
        }),
        child: Container(
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 200,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.fill,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                widget.mealslist[widget.index].imageUrl,
                fit: BoxFit.fitWidth,
                loadingBuilder: (ctx, Widget child, loadingprogress) {
                  if (loadingprogress == null) {
                    return child;
                  }
                  return LoadingAnimationWidget.bouncingBall(
                      color: Colors.white38, size: 5);
                },
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
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
                Text(widget.mealslist[widget.index].duration.toString()),
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
                Text(comp(widget.mealslist[widget.index].complexity) as String),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.currency_rupee),
                Text(afford(widget.mealslist[widget.index].affordability)
                    as String),
              ],
            )
          ])
    ] : []);
  }
}
