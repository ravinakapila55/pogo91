import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class EditText extends StatelessWidget {
  String hint;
  double marginTop = 0;
  EditText({@required String hint, double marginTop: 0}) {
    this.hint = hint;
    this.marginTop = marginTop;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: marginTop),
        decoration: BoxDecoration(
            border: Border.all(color: edtBorderColor), color: edtBgGreyColor),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: hint),
          style: TextStyle(
            fontSize: 12,
          ),
        ));
  }
}
