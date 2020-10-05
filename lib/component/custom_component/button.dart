import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';

class ButtonRegular extends StatelessWidget {
  String label;
  double textSize;
  Color btn_bg;
  Color border_color;

  ButtonRegular(
      {@required this.label,
      this.textSize: 14,
      this.btn_bg: yellow,
      this.border_color = yellow});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: btn_bg,
            border: Border.all(color: border_color),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: MaterialButton(
          elevation: 0.0,
          child: Text(
            label,
            style: TextStyle(
                fontSize: textSize,
                color: Constants.login_button_blue,
                fontFamily: 'LatoRegular'),
          ),
          color: Constants.yellow,
        ));
  }
}
