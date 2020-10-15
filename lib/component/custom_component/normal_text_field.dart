import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class NormalTextField extends StatelessWidget {
  double textSize;
  String label;
  Color textColor;
  TextDecoration textDecoration;
  TextAlign textAlign;
  int maxLines;
  NormalTextField(
      {this.textSize: 14,
      @required this.label,
      this.textColor: greyColor,
      this.textDecoration: TextDecoration.none,
      textAlign: TextAlign.start,
      this.maxLines: 1000});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontFamily: 'LatoRegular',
          decoration: textDecoration),
    );
  }
}
