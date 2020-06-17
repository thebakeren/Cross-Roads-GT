import 'package:crossroads/main.dart';
import 'package:crossroads/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoadSignsStateful extends StatefulWidget{
  @override
  RoadSigns createState() => new  RoadSigns();

}
class RoadSigns extends State{

  final _biggerFont= const TextStyle(fontSize: 14.99,fontWeight: FontWeight.bold,color: Colors.blue);
  @override
  Widget build(BuildContext context) {

    return new ListView.builder(

        padding: const EdgeInsets.all(4),
        itemCount: traffic_sign.length,
        itemBuilder: /*1*/ (context, i) {
          final _suggestion=<Choice>[traffic_sign[i]];
          return _buildRow(_suggestion[0]);
        });



  }
  Widget _buildRow(Choice pair) {
    return new ListTile(leading: Icon(pair.icon,size: pair.size,),isThreeLine: true,
      subtitle: Text(pair.info,style: TextStyle(color: Colors.blueGrey),),
      title: Text(
        pair.title,
        style: _biggerFont,
      ), onTap: (){


      },contentPadding:const EdgeInsets.all(20),);
  }



}
class Choice {


  const Choice({this.title, this.icon,this.size,this.info});
  final double size;
  final String title,info;
  final IconData icon;
}




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
