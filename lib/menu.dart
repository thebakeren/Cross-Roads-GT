
import 'package:crossroads/roadSigns.dart';
import 'package:crossroads/menuItemRight.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: MenuItemRight(),
      ),
    );
  }

}
/*
class _MenuState extends State<MenuBar>{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: "",
         actions: ,
     );
  }

}
class MenuBar extends StatefulWidget{
  @override
  _MenuState createState() => _MenuState();

}

class Choice{

  Choice({this.title,this.icon});

  final String title;
  final IconData icon  ;
}

 List<Choice> menuItems=<Choice>[
  Choice(title:"Menu",icon: Icons.menu),
  Choice(title:"Setting",icon: Icons.settings_applications)

];

*/