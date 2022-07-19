import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'favouritescreen.dart';
import 'maindrawer.dart';

class Navigationbar extends StatefulWidget {
  //Navigationbar({Key? key}) : super(key: key);
  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  final _screen = [
    {'screen':Homescreen(),'title':'Meals Mela'},{'screen':Favouritescreen(),'title':'Favourites'}
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
      appBar: AppBar(title: Text(_screen[index]['title'] as String),),
      drawer: Maindrawer(),
        body: _screen[index]['screen'] as Widget,
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
        ));
  }
}
