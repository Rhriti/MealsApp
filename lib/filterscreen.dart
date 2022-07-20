import 'package:flutter/material.dart';
import 'maindrawer.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Filterscreen extends StatefulWidget {
  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  //const Filterscreen({Key? key}) : super(key: key);
  bool st1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
        ),
        drawer: Maindrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(gradient: LinearGradient(
                    colors: [Colors.blue,Colors.orange],begin: Alignment.topRight,end:Alignment.bottomLeft)),
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Text(
                      'SELECT YOUR ❤ MEALS',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
      
              SizedBox(height: 20,),
              SwitchListTile(
              title: Text('Vegan'),secondary: Text('🥦',style: TextStyle(fontSize: 30),),
                  value: st1,
                  onChanged: (val) {
                    st1 = val;
                  })
            ],
          ),
        ));
  }
}
