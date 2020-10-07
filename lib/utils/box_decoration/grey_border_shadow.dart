import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class GreyBorderShadow {
  BoxDecoration getBorderShow() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: greyButtonColor),
        borderRadius: BorderRadius.all(Radius.circular(5.0)));
  }
}
