import 'package:flutter/material.dart';

class TextFieldRegular extends StatelessWidget {
  String label;
  double marginTop;
  Color textColor;
  Alignment textAligment;
  TextAlign textAlign;
  double textSize;
  TextFieldRegular(
      {@required this.label,
      this.marginTop: 20.0,
      this.textColor: Colors.black,
      this.textAligment: Alignment.centerLeft,
      this.textSize: 12,
      this.textAlign: TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      alignment: textAligment,
      margin: EdgeInsets.only(top: marginTop),
      child: Text(
        label,
        maxLines: 2,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: textSize, color: textColor, fontFamily: 'LatoRegular'),
      ),
    );
  }
}
