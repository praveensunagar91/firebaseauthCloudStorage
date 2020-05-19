import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';


class spinner extends StatefulWidget {
  @override
  _spinnerState createState() => _spinnerState();
}

class _spinnerState extends State<spinner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SpinKitCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
