import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Authenticate/authenticate.dart';
import 'package:flutterapp/crudOperations/form.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/Screens/home/home.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ///reciving user data of user class by using provider package


    final user= Provider.of<User>(context);
    print(user);

    if(user == null){
      return authenticate();

    }else{
      return home();
    }
  }
}
