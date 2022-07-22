import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'favouritescreen.dart';
import 'maindrawer.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Navigationbar extends StatefulWidget {
  //Navigationbar({Key? key}) : super(key: key);
  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  final _screen = [
    {'screen': Homescreen(), 'title': 'Meals Mela'},
    {'screen': Favouritescreen(), 'title': 'Favourites'}
  ];
  int index = 0;

  void changescreen(int n) {
    setState(() {
      index = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
          centerTitle: true,
          title: Text(_screen[index]['title'] as String,),
                    gradient: LinearGradient(end:Alignment.bottomLeft,begin: Alignment.topRight,colors: [Color.fromARGB(255, 141, 141, 246),Color.fromARGB(255, 34, 36, 37)],),),
        drawer: Maindrawer(),
        body: _screen[index]['screen'] as Widget,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(end:Alignment.bottomLeft,begin: Alignment.topRight,colors: [Color.fromARGB(255, 141, 141, 246),Color.fromARGB(255, 34, 36, 37)],),
          ),
          child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(size: 35),
            selectedItemColor: Color.fromARGB(255, 6, 139, 247),
            unselectedItemColor: Colors.white38,
            backgroundColor: Colors.transparent,
            iconSize: 30,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Category',
                  ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favourotes',
                  )
            ],
            currentIndex: index,
            onTap: changescreen,
          ),
        ));
  }
}
