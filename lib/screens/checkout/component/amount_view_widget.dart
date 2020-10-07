import 'package:flutter/material.dart';
import 'package:pogo91/screens/store_list/all_shops_screen.dart';
import 'package:pogo91/utils/colors.dart';

class PriceDetailTitleAmount extends StatelessWidget {
  String leftTitleButton;
  String rightTitleButton;

  PriceDetailTitleAmount(String leftTitleButton, String rightTitleButton) {
    this.leftTitleButton = leftTitleButton;
    this.rightTitleButton = rightTitleButton;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0),
        height: 40,
        child: Row(
          children: [
            Text(
              leftTitleButton,
              style: TextStyle(
                  fontSize: 13, color: Colors.black, fontFamily: 'LatoRegular'),
            ),
            Spacer(),
            Text(
              rightTitleButton,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 13,
                  color: labelGreyColor,
                  fontFamily: 'LatoRegular'),
            )
          ],
        ));
  }
}
