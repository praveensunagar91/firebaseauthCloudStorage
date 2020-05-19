
import 'package:flutter/material.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/spinners/spinner.dart';



class signIn extends StatefulWidget {

  final Function toggleView;
  signIn({this.toggleView});
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {

  final AuthService _auth= AuthService();
  final _formkey= GlobalKey<FormState>();
  bool loading=false;

  String email="";
  String password="";
  String error="";


  click() async{
    if(_formkey.currentState.validate()){
       setState(() {
         loading=true;
       });
     dynamic result =   await _auth.signinwithemailpass(email, password);

     if(result == null){
       setState(() {
         error="could not signIn with credentials";
         loading=false;

         print(result);
       });
     }
    }

  }

  @override
  Widget build(BuildContext context) {
    return loading ? spinner() : Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('SignIn Here',
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.pink[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.black,),
            label: Text("Register",
            style: TextStyle(
              color: Colors.black,
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
              validator: (value) => value.isEmpty ? " Enter email" : null ,
              onChanged: (value){
                setState(() {
                  email=value;
                });
              },
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
              obscureText: true,
              validator: (value) => value.length<6 ? 'Enter pasword atleast 6 characters' : null,
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
                color: Colors.blue,
                onPressed: click,

              ),
            ),
            SizedBox(height: 20.0,),
            Center(
              child: Text(error,style: TextStyle(

                color:Colors.red,

              ),),
            ),

          ],

        ),

      ),
    );
  }
}
