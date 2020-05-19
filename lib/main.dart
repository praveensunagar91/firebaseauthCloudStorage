import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/wrapper.dart';
import 'package:flutterapp/Services/auth.dart';

import 'package:provider/provider.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/models/user.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///accssing user values from user class by provider pacakge
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        home: wrapper(),
      ),
    );
  }
}
