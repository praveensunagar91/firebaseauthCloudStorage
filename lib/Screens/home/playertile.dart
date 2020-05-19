import 'package:flutter/material.dart';
import 'package:flutterapp/models/PlayerDataList.dart';


class playertile extends StatelessWidget {
  
  final PlayerList player;
  playertile({this.player});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20.0),
       child: Card(
         margin: EdgeInsets.only(left:20.0,right: 20.0),
         
         child: ListTile(
           leading: Text(player.name),
           title: Text(player.country),
         ),
       ),
    );
  }
}
