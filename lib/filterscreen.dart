import 'package:flutter/material.dart';
import 'maindrawer.dart';


class Filterscreen extends StatefulWidget {
  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  //const Filterscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter'),),
        drawer: Maindrawer(),
        body: Center(
          child: Text('filter'),
        ));
  }
}
