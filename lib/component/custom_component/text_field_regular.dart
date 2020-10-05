import 'dart:ffi';

import 'package:flutter/material.dart';

class TextFieldRegular extends StatelessWidget {
  String label;
  double marginTop;
  Color textColor;
  Alignment textAligment;
  TextFieldRegular(
      {@required this.label,
      this.marginTop: 20.0,
      this.textColor: Colors.black,
      this.textAligment: Alignment.centerLeft});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      alignment: textAligment,
      margin: EdgeInsets.only(top: marginTop),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 12, color: textColor, fontFamily: 'LatoRegular'),
      ),
    );
  }
}
