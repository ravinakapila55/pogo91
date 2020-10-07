import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class DarkGreyBorderShadow {
  BoxDecoration getBorderShow() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: darkgreyButtonColor),
        borderRadius: BorderRadius.all(Radius.circular(5.0)));
  }
}
