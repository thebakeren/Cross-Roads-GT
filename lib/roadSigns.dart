import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoadSignsStateful extends StatefulWidget{
  @override
  RoadSigns createState() => RoadSigns();

}
class RoadSigns extends State<RoadSignsStateful>{

  final _biggerFont= const TextStyle(fontSize: 14.99,fontWeight: FontWeight.bold,color: Colors.blue);
  @override
  Widget build(BuildContext context) {

    return ListView.builder(

        padding: const EdgeInsets.all(4),
        itemCount: traffic_sign.length,
        itemBuilder: /*1*/ (context, i) {
          final _suggestion=<Choice>[traffic_sign[i]];
          return _buildRow(_suggestion[0]);
        });



  }
  Widget _buildRow(Choice pair) {
    return ListTile(leading: Icon(pair.icon,size: pair.size,),isThreeLine: true,
      subtitle: Text(pair.info,style: TextStyle(color: Colors.blueGrey),),
      title: Text(
        pair.title,
        style: _biggerFont,
      ), onTap: () => {
      
            print(pair.title)
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
  const Choice(title: "Warning Signs",icon: Icons.warning,size: 60,
      info:"Warning signs are erected to warn road users of hazard"),
  const Choice(title: "Give Way Signs",icon: Icons.change_history,size: 60,
  info: "Give way signs are erected to warn road users of hazard"),
  const Choice(title: "Prohibitory Signs",icon: Icons.not_interested,size: 60,
  info: "Prohibitory signs apply from the point where the sign is erected"),
  const Choice(title: "Speed Limits",icon: Icons.looks_6,size: 60,info: "Speed limit indicate the maximum "
      "permitted speed limit one is allowed to drive and apply to a point where another speed limit is erected"),
  const Choice(title: "Mandatory Signs",icon: Icons.directions_walk,size: 60,info: "Mandatory signs indicating that a particular"
      " kind of traffic is mandatory or prohibited"),
  const Choice(title: "Direction Signs",icon: Icons.directions,size: 60,info: "Direction signs point a road user to a certain location"),
  const Choice(title: "Instruction Signs",icon: Icons.call_merge,size: 60,info: "Instruction Signs tell a road user about a certain circumstance that apply at a place"),
  const Choice(title: "Information Signs And Symbol",icon: Icons.landscape,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Symbols",icon: Icons.directions,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Supplementary Plates",icon: Icons.rate_review,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: " Traffic with Supplementary Plates",icon: Icons.book,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Instructions",icon: Icons.directions,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Traffic Officers",icon: Icons.rate_review,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Police Officers",icon: Icons.book,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Transport Officers",icon: Icons.book,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Traffic Lights",icon: Icons.book,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Level Crossing",icon: Icons.book,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Road Markings",icon: Icons.directions,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Central Barrier",icon: Icons.rate_review,size: 60,info: "Used on direction signs to indicate a place"),
  const Choice(title: "Delineator Post",icon: Icons.book,size: 60,info: "Used on direction signs to indicate a place"),

];
const List<Choice> traffic_sign_supplementary = const <Choice>[

];
const List<Choice> safe_traffic_environments = const <Choice>[


];
const List<Choice> road_markings = const <Choice>[


];