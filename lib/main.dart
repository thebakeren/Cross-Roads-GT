
import 'package:crossroads/menuItemRight.dart';
import 'package:crossroads/roadSigns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

// This app is a stateful, it tracks the user's current choice.
/*
class CrossRoadsStateful  extends StatefulWidget {
  @override
  CrossRoads createState() => new CrossRoads();
}

class CrossRoads extends State {
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
  Widget build(BuildContext context) {

    return MaterialApp(
      title: getTitle(),
      
      home: DefaultTabController(
        length: 3,
        child: Scaffold(

          body:tabView(RoadSignsStateful()),
          appBar: appBar(),
        ),
       
      ),
      
    );
    
  }

  tabView(StatefulWidget widget){

    print(widget);
     return new TabBarView(children: [
      widget,
      Icon(Icons.chat_bubble_outline),Icon(Icons.chat_bubble_outline)
    ],);

  }

  appBar(){
   return AppBar(
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
*/class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);
  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with TickerProviderStateMixin {

  var _wizard, _wizard_buttom;
  final List<Tab> _tabsBottom = <Tab>[
    Tab( icon: Icon(tab_choices[2].icon),text: tab_choices[2].title,),
    Tab( icon: Icon(tab_choices[2].icon),text: tab_choices[2].title,),
  ];
  final List<Tab> _tabs = <Tab>[

      Tab(icon: Icon(tab_choices[0].icon),text: tab_choices[0].title),
      Tab(icon: Icon(tab_choices[1].icon),text: tab_choices[1].title,)
      ,Tab( icon: Icon(tab_choices[2].icon),text: tab_choices[2].title,),

  ];
  String _title = "Cross Roads";

  void setTitle(String _title) {
    this._title = _title;
  }

  String getTitle() {
    return _title;
  }
  TabController _tabController;
  TabController _tabControllerBottom;

  @override
  void initState() {
    super.initState();

    print("hello");
    _tabController = new TabController(vsync: this, length: _tabs.length);
    _tabControllerBottom = new TabController(vsync: this, length: _tabsBottom.length);
    _wizard_buttom=
    new TabBarView(
      controller: _tabControllerBottom,
      children: <Widget>[new ListView(children: <Widget>[
        new ListTile(title: Text("Late"),onTap: (){
          setState(() {
            _wizard = new Icon(Icons.print);
          });


        },)
      ],),Icon(Icons.radio),Icon(Icons.radio)],
    );
    _wizard=new TabBarView(
      controller: _tabController,
      children: <Widget>[new ListView(children: <Widget>[
        new ListTile(title: Text("Late"),onTap: (){
          setState(() {
            _wizard = new Icon(Icons.print);
          });


        },)
      ],),Icon(Icons.radio),Icon(Icons.radio)],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {

      setState(() {
      _wizard_buttom=  new TabBarView(
          controller: _tabControllerBottom,
          children: <Widget>[new ListView(children: <Widget>[
            new ListTile(title: Text("Late"),onTap: (){
              setState(() {
                _wizard = new Icon(Icons.print);
              });


            },)
          ],),Icon(Icons.radio),Icon(Icons.radio)],
        );
        _wizard=new TabBarView(
          controller: _tabController,
          children: <Widget>[new ListView(children: <Widget>[
            new ListTile(title: Text("Late"),onTap: (){
              setState(() {
                _wizard = new Icon(Icons.print);
              });


            },)
          ],),Icon(Icons.radio),Icon(Icons.radio)],
        );
      });

    });
    return
      MaterialApp(
      home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          PopupMenuButton<Choice>( icon: Icon(Icons.menu),
            onSelected:null,
            itemBuilder:(BuildContext context) {
              return menuItems_choices.skip(2).map((e) =>
                  PopupMenuItem<Choice>(child:Text(e.title),)).toList();
            },
          )
        ],
        title: Text(_title),
        leading: Icon(menuItems_choices[1].icon),
        bottom:new TabBar(
          controller: _tabController,
          tabs: _tabs,labelColor: Colors.amber,indicatorSize:TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white)
    ),

        ) ,
      body: new Container(child:_wizard ,),persistentFooterButtons: <Widget>[Container(child:IconButton(onPressed: () {  },icon: Icon(Icons.comment,color: Colors.blueGrey,),),height: 30),
    Container(child:IconButton(onPressed: () {  } ,icon: Icon(Icons.turned_in,color: Colors.blueGrey,),),height: 30,)],
    ));
  }
}
//new Container(child: new TabBar(tabs: _tabsBottom,controller: _tabControllerBottom,labelColor: Colors.amber,indicatorSize:TabBarIndicatorSize.tab,
//          labelStyle: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),color: Colors.blueGrey,)

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
  const Choice(title: "Theory",icon: Icons.book,size: 15),
  const Choice(title: "Final Test",icon: Icons.rate_review,size: 15),

];

const List<Choice> tab_choices_bottom = const <Choice>[
  const Choice(title: "Tutor",icon: Icons.hot_tub,size: 15),
  const Choice(title: "Comments",icon: Icons.comment,size: 15),
];


main() {
  runApp(new MyTabbedPage());
}