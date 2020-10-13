import 'package:flutter/material.dart';

class LocationBase extends StatefulWidget {
  LocationBaseState createState() => LocationBaseState();
}

class LocationBaseState<T extends LocationBase> extends State<T> {
  int changeState;

  void setView() {
    setState(() {
      changeState = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
