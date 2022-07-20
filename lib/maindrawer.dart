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
      
        backgroundColor: Colors.black38,
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
              leading: Icon(Icons.home,size: 35,),
              title: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            SizedBox(height: 5,),
            ListTile(
              leading: Icon(Icons.stacked_bar_chart,size: 35,),
              title: Text('Filter',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/filterscreen');
              },
            )
          ],
        ));
  }
}
