
import 'package:crossroads/menuItemRight.dart';
import 'package:crossroads/roadSigns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This app is a stateful, it tracks the user's current choice.
class BasicAppBarSample extends StatefulWidget {
  @override
  _CrossRoads createState() => _CrossRoads();
}

class _CrossRoads extends State {
  String _title = "Cross Roads";

  void setTitle(String _title) {
    this._title = _title;
  }

  String getTitle() {
    return _title;
  }


  Choice _selectedChoice = menuItems_choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cross Roads",
      
      home: DefaultTabController(
        length: 3,
        child: Scaffold(

          body: TabBarView(children: [
            RoadSignsStateful(),
            Icon(Icons.chat_bubble_outline),Icon(Icons.chat_bubble_outline)
          ],),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            bottom: mainTab(),
            actions: <Widget>[
          PopupMenuButton<Choice>( icon: Icon(Icons.menu),
          onSelected:_select,
          itemBuilder:(BuildContext context) {
            return menuItems_choices.skip(2).map((e) =>
                PopupMenuItem<Choice>(child:Text(e.title),)).toList();
          },
        )
            ],
            title: Text(getTitle()),
            leading: Icon(menuItems_choices[1].icon),
           
          ),
        ),
       
      ),
      
    );
    
  }

  mainTab(){
    return TabBar(tabs: [
      Tab(icon: Icon(tab_choices[0].icon),text: tab_choices[0].title),
      Tab(icon: Icon(tab_choices[1].icon),text: tab_choices[1].title,)
      ,Tab( icon: Icon(tab_choices[2].icon),text: tab_choices[2].title,)],controller:null
      ,labelColor: Colors.amber,indicatorSize:TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),);
  }
}


class Choice {
 

  const Choice({this.title, this.icon,this.size});
  final double size;
  final String title;
  final IconData icon;
}


const List<Choice> menuItems_choices = const <Choice>[
  const Choice(title: 'logo', icon: Icons.directions_car,size: 15),
  const Choice(title: 'settings', icon: Icons.settings_applications,size: 26),

  const Choice(title: 'Sign In', icon: Icons.directions_boat,size: 15),
  const Choice(title: 'Register', icon: Icons.directions_bus,size: 15),
  const Choice(title: 'Help', icon: Icons.directions_railway,size: 15),
  const Choice(title: 'About', icon: Icons.directions_walk,size: 15),

];
const List<Choice> tab_choices = const <Choice>[
  const Choice(title: "Road Signs",icon: Icons.directions,size: 15),
  const Choice(title: "Final Test",icon: Icons.rate_review,size: 15),
  const Choice(title: "Theory",icon: Icons.book,size: 15),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
   final String _title = "Cross Roads";



  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return GridView.count(primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 2,children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        child:Card(color: Colors.blueAccent,shadowColor: Colors.grey,child: Text("Road"),),
        color: Colors.white,


      )
    ],

    );
  }
}

void main() {
  runApp(BasicAppBarSample());
}
