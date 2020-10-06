import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';

class ProductCategroyTab extends StatelessWidget {
  bool isTabSelected = false;
  ProductCategroyTab({this.isTabSelected: false});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: ((isTabSelected)
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2.0, color: yellow),
              ),
              color: Colors.white,
            )
          : BoxDecoration()),
      padding: EdgeInsets.all(10),
      child: Text(
        "Fruits",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 12,
            color: loginButtonBlueColor,
            fontFamily: 'LatoRegular'),
      ),
    );
  }
}
