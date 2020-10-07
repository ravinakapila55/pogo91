import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class GreySolidShadow {
  BoxDecoration getBorderShow() {
    return BoxDecoration(
        color: greyButtonColor,
        border: Border.all(color: greyButtonColor),
        borderRadius: BorderRadius.all(Radius.circular(5.0)));
  }
}
