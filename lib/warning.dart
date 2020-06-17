import 'package:crossroads/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WarningStateful extends StatefulWidget{
  @override
  Warning  createState() => Warning();

}
class Warning extends State{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Warning",
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: null,
        ) ,
      ),

    );
  }
  
}