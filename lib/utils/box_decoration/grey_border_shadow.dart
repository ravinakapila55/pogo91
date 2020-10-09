import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class GreyBorderShadow {
  BoxDecoration getBorderShow(
      {Color borderColor: greyButtonColor, Color solidColor: Colors.white}) {
    return BoxDecoration(
        color: solidColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(5.0)));
  }
}
