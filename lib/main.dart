
import 'package:crossroads/menuItemRight.dart';
import 'package:crossroads/roadSigns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

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
*/
class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);
  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with TickerProviderStateMixin {

  var _wizard;
  final _biggerFont= const TextStyle(fontSize: 14.99,fontWeight: FontWeight.bold,color: Colors.blue);

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
  TabController _tabControllerSigns;

 Widget trafficItems(var choice){
      Symbols().execImg();
      return new ListTile(onTap: (){
      setState(() {

      _wizard = new Container(child: new ListView.builder(itemBuilder:(context, index) {

        final _suggestion=<Symbols>[_symbols[index]];
         return _roadSigns(_suggestion[0]);
      },itemCount: _symbols.length,),);

      });


      },leading: Icon(choice.icon),isThreeLine: true,
        subtitle: Text(choice.info,style: TextStyle(color: Colors.blueGrey),),title: Text(
            choice.title,
            style: _biggerFont,
          )
        );


  }
  Widget _roadSigns(Symbols symbols){

    return new ListTile(onTap: (){
      setState(() {

        _wizard = new Container(child: new ListView.builder(itemBuilder:(context, index) {
          final _suggestion=<Symbols>[_symbols[index]];
          return _roadSigns(_suggestion[0]);
        },itemCount: _symbols.length,),);
      });


    },leading: Image(image:symbols.icon.image,),isThreeLine: true,
        subtitle: Text(symbols.info,style: TextStyle(color: Colors.blueGrey),),title: Text(
          symbols.title,
          style: _biggerFont,
        )
   );

  }
  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: _tabs.length);


    _wizard=new TabBarView(
      controller: _tabController,
      children: <Widget>[new ListView.builder(itemBuilder:(context, index) {
        final _suggestion=<Choice>[traffic_sign[index]];
        return trafficItems(_suggestion[0]);
      },itemCount: traffic_sign.length,padding: const EdgeInsets.all(4),),Icon(Icons.radio),Icon(Icons.radio)],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override

  @override
  Widget build(BuildContext context) {


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
            labelStyle: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),onTap: (value) {
          setState(() {


            _wizard=new TabBarView(
              controller: _tabController,
              children: <Widget>[new ListView.builder(itemBuilder:(context, index) {
                final _suggestion=<Choice>[traffic_sign[index]];
                return trafficItems(_suggestion[0]);
              },itemCount: traffic_sign.length,padding: const EdgeInsets.all(4),),Icon(Icons.radio),Icon(Icons.radio)],
            );

          });
            },
    ),

        ) ,
      body: new Container(child:_wizard,),persistentFooterButtons: <Widget>[Container(child:IconButton(onPressed: () {  },icon: Icon(Icons.comment,color: Colors.blueGrey,),),height: 30),
    Container(child:IconButton(onPressed: () {  } ,icon: Icon(Icons.turned_in,color: Colors.blueGrey,),),height: 30,)],
    ));
  }
}

class Choice {


  const Choice({this.title, this.icon,this.size,this.info});
  final double size;
  final String title,info;
  final IconData icon;
}
class Symbols {


  const Symbols({this.title, this.icon,this.size,this.info});
  final double size;
  final String title,info;
  final Image icon;


  execImg(){

    for(int x=0;x<30;x++) {
      const url=AssetImage("road/roadsigns/asset $x.png");
      _symbols = const <Symbols>[
        const Symbols(title: "Warning Signs",
            icon: Image(image:url,
              color: null,
              width: 10,
              height: 10,),
            size: 50,
            info: "Warning signs are erected to warn road users of hazard"),
        const Symbols(title: "Give Way Signs",
            icon: Image(image: AssetImage("road/roadsigns/asset 1.png"),
              color: null,
              width: 10,
              height: 10,),
            size: 50,
            info: "Give way signs are erected to warn road users of hazard"),

      ];
    }
  }
}
 List<Symbols> _symbols=<Symbols>[];


const List<Choice> traffic_sign = const <Choice>[
  const Choice(title: "Warning Signs",icon: Icons.warning,size: 50,
      info:"Warning signs are erected to warn road users of hazard"),
  const Choice(title: "Give Way Signs",icon: Icons.change_history,size: 50,
      info: "Give way signs are erected to warn road users of hazard"),
  const Choice(title: "Prohibitory Signs",icon: Icons.not_interested,size: 50,
      info: "Prohibitory signs apply from the point where the sign is erected"),
  const Choice(title: "Speed Limits",icon: Icons.looks_6,size: 50,info: "Speed limit indicate the maximum "
      "permitted speed limit one is allowed to drive and apply to a point where another speed limit is erected"),
  const Choice(title: "Mandatory Signs",icon: Icons.directions_walk,size: 50,info: "Mandatory signs indicating that a particular"
      " kind of traffic is mandatory or prohibited"),
  const Choice(title: "Direction Signs",icon: Icons.directions,size: 50,info: "Direction signs point a road user to a certain location"),
  const Choice(title: "Instruction Signs",icon: Icons.call_merge,size: 50,info: "Instruction Signs tell a road user about a certain circumstance that apply at a place"),
  const Choice(title: "Information Signs",icon: Icons.landscape,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Symbols",icon: Icons.directions_bus,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Supplementary Plates",icon: Icons.timer_10,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Traffic signs with Supplementary Plates",icon: Icons.traffic,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Traffic Officers",icon: Icons.pan_tool,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Police Officers",icon: Icons.local_car_wash,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Transport Officers",icon: Icons.person,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Traffic Lights",icon: Icons.traffic,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Level Crossing",icon: Icons.tram,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Road Markings",icon: Icons.straighten,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Central Barrier",icon: Icons.view_stream,size: 50,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Delineator Post",icon: Icons.wb_iridescent,size: 50,info: "Used on direction signs to indicate a place"),

];

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