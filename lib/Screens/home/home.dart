

import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home/playerlist.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/Services/operation.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatelessWidget {

  final AuthService _auth= AuthService();



  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DataService().player,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('cricketWorld'),
          backgroundColor: Colors.pink[300],
          elevation: 0.0,

          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person,color: Colors.black,),
              label: Text('logout',
              style: TextStyle(
                color: Colors.black,
              ),),
            ),
          ],
        ),
        body: playerlist(),
      ),
    );
  }
}
