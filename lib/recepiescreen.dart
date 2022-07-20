import 'package:flutter/material.dart';
import 'package:mealsapp/mealslist.dart';
import 'meal.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Recepie extends StatelessWidget {
  //const Recepie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 30,
          tooltip: 'Tap to delete',
          splashColor: Colors.amber,
          backgroundColor: Color.fromARGB(255, 141, 141, 246),
          onPressed: () {
            Navigator.of(context).pop('kill');
          },
          child: Icon(Icons.delete),
        ),
        appBar: NewGradientAppBar(
          centerTitle: true,
          title: Text('Recipe'),
          gradient: LinearGradient(
            end: Alignment.bottomLeft,
            begin: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 34, 36, 37),Color.fromARGB(255, 141, 141, 246),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(4),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                routeArgs.imageUrl,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'INGREDIENTS',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 141, 141, 246),
                letterSpacing: 4,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 7,),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient( colors: [
              Color.fromARGB(255, 141, 141, 246),
              Color.fromARGB(255, 34, 36, 37)
            ],),
                  borderRadius: BorderRadius.circular(30),
                ),
              child: Wrap(
                
                alignment: WrapAlignment.center,
                runSpacing: 10,
                children: [
                  SizedBox(width: 5,),
                  ...List.generate(routeArgs.ingredients.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text('# ${index + 1}'),
                            foregroundColor: Colors.white),
                        SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            '${routeArgs.ingredients[index]}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'STEPS',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 141, 141, 246),
                letterSpacing: 4,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
                height: 400,
                margin: EdgeInsets.all(20),
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: List.generate(routeArgs.steps.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(' # ${index + 1} '),
                              foregroundColor: Colors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(routeArgs.steps[index]),
                          )
                        ],
                      ),
                    );
                  }),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient( colors: [
              Color.fromARGB(255, 141, 141, 246),
              Color.fromARGB(255, 34, 36, 37)
            ],),
                  borderRadius: BorderRadius.circular(30),
                )
                )
          ],
        ));
  }
}
