import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';

class ProductCategroyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        "Fruits",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 12,
            color: Constants.login_button_blue,
            fontFamily: 'LatoRegular'),
      ),
      color: Colors.white,
    );
  }
}
