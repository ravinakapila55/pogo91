import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  Color bgColor;
  Background({Key key, @required this.child, this.bgColor: Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: bgColor,
      child: child,
    );
  }
}
