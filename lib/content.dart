
import 'package:crossroads/roadSigns.dart';
import 'package:crossroads/menuItemRight.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Content extends StatelessWidget{



  @override
  Widget build(BuildContext context) {


    final wordPair=WordPair.random();
    return MaterialApp(
      title: "Welcome",
      home: Scaffold(
        body: Center(
          child: MenuItemRight(),
        ) ,
      ),
    );
  }
  
}