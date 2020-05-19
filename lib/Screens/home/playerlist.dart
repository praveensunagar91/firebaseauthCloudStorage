import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home/playertile.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class playerlist extends StatefulWidget {
  @override
  _playerlistState createState() => _playerlistState();
}

class _playerlistState extends State<playerlist> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<QuerySnapshot>(context);
    for (var item in player.documents) {

      return ListView.builder(
        itemCount: item.data.toString().length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(item.data['name'].toString()),
              title: Text(item.data['country'].toString()),
            ),
          );
        },
      );
    }
  }
}



