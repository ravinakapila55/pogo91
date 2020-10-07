import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class GreenSolidShadow {
  BoxDecoration getDecoration() {
    return BoxDecoration(
      color: greenColor,
      border: Border.all(color: greenColor),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}
