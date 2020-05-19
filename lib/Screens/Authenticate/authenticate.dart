import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Authenticate/signIn.dart';
import 'package:flutterapp/Screens/Authenticate/register.dart';


 class authenticate extends StatefulWidget {
   @override
   _authenticateState createState() => _authenticateState();
 }

 class _authenticateState extends State<authenticate> {

  bool showSignin=true;

  void toggleView(){
    setState(() {
      showSignin=!showSignin;
    });
  }
   @override
   Widget build(BuildContext context) {
     if(showSignin){
       return signIn(toggleView:toggleView);
     }
     else
       {
         return register(toggleView:toggleView);
       }
   }
 }

