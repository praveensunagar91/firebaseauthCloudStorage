

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/Screens/Authenticate/signIn.dart';
import 'package:flutterapp/spinners/spinner.dart';


class register extends StatefulWidget {

  final Function toggleView;
  register({this.toggleView});
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  final AuthService _auth= AuthService();
  final _formkey= GlobalKey<FormState>();

  String email='';
  String password='';
  String error='';
  bool loading=false;

  click() async {

  if(_formkey.currentState.validate()) {
    setState(() {
      loading=true;
    });
   dynamic result = await _auth.registerwithemailpass(email, password);
   if(result == null){
     setState(() {
       error="Enter credentials correctly ";
         loading=false;
       print(result);


     });
   }
   else{
     return signIn();
   }

  }
  }
  @override
  Widget build(BuildContext context) {
    return loading ? spinner() : Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Register Here'),
        backgroundColor: Colors.pink[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.black,),
            label: Text("SignIn",
              style: TextStyle(
                  color: Colors.black
              ),),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Form(
        key: _formkey,
        child: ListView(
             padding: EdgeInsets.symmetric(horizontal: 50.0,),
          children: <Widget>[
            SizedBox(height: 70.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Email',
              ),
              validator: (value)=> value.isEmpty ? "Enter email" : null ,
              onChanged: (value){
                setState(() {
                  email=value;
                });
              },
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Passowrd',
              ),
              obscureText: true,
              validator: (value) => value.length < 6 ? 'Enter atleast 6 characters' : null ,

              onChanged: (value){
                setState(() {
                  password=value;
                });
              },
            ),
            SizedBox(height: 50.0,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 90.0),
              child: RaisedButton(
                child: Text("Submit",
                style: TextStyle(
                  color: Colors.white
                ),),
                color: Colors.teal,
                onPressed: click,

              ),
            ),

             SizedBox(height: 20.0,),
             Center(
               child: Text(error,style: TextStyle(

                 color:Colors.red,
                 fontSize: 15.0,

               ),),
             ),

          ],

        ),

      ),
    );
  }
}
