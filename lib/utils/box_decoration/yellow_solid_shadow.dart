import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class YellowSolidShadow {
  BoxDecoration getDecoration() {
    return BoxDecoration(
      color: darkYellow,
      border: Border.all(color: darkYellow),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}
