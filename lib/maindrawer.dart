import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Maindrawer extends StatefulWidget {
  @override
  State<Maindrawer> createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  //const Maindrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: Border(right: BorderSide(color: Colors.white)),
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            DrawerHeader(
              //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 100),
                  'COMING UP !',
                  textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ]),
            ),
            ListTile(
              //tileColor: Colors.white,
              leading: Icon(Icons.home,size: 35,color: Colors.white,),
              title: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            SizedBox(height: 5,),
            ListTile(
              //tileColor: Colors.white,
              leading: Icon(Icons.category,size: 35,color: Colors.white,),
              title: Text('Filter',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/filterscreen');
              },
            )
          ],
        ));
  }
}
