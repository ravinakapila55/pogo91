import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class CircleGreyDecoration {
  Widget getRoundedWidget() {
    return Container(
      width: 4,
      height: 4,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: greyDottedColor,
      ),
    );
    ;
  }
}
