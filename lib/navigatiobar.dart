import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'favouritescreen.dart';

class Navigationbar extends StatefulWidget {
  //Navigationbar({Key? key}) : super(key: key);
  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  final _screen = [
    Homescreen(),Favouritescreen()
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
        body: _screen[index] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Category',
                backgroundColor: Colors.amber),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favourotes',
                backgroundColor: Colors.amber)
          ],
          currentIndex: index,
          onTap: changescreen,
        )
        );
  }
}
