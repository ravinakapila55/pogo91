import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class YellowBorderShadow {
  BoxDecoration getDecoration() {
    return BoxDecoration(
      border: Border.all(color: darkYellow),
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    );
  }
}
