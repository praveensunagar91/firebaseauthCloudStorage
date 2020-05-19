import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class operation extends StatefulWidget {
  @override
  _operationState createState() => _operationState();
}

class _operationState extends State<operation> {

  DocumentReference _documentReference = Firestore.instance.document('players');



  click() {
    Map<String,String> data=<String,String> {
      "name":"praveen Sunagar",
      "petname":"maxwell",
    };
    _documentReference.setData(data).whenComplete((){
      print("record added");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add data'),
      ),
      body: Container(
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 20.0,),

              RaisedButton(
                onPressed: click,
                child: Text('add data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
