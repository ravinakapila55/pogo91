import 'package:flutter/material.dart';
import 'package:pogo91/view/store_list/all_shops_screen.dart';
import 'package:pogo91/utils/colors.dart';

class StoreHeader extends StatelessWidget {
  String leftTitleButton;
  String rightTitleButton;
  Function onPressed;

  StoreHeader(String leftTitleButton, String rightTitleButton,
      {this.onPressed}) {
    this.leftTitleButton = leftTitleButton;
    this.rightTitleButton = rightTitleButton;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 26, 20, 0),
        child: Row(
          children: [
            Text(
              leftTitleButton,
              style: TextStyle(
                  fontSize: 15, color: Colors.black, fontFamily: 'LatoRegular'),
            ),
            Spacer(),
            new InkWell(
                onTap: onPressed,
                child: Text(
                  rightTitleButton,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 15,
                      color: labelGreyColor,
                      fontFamily: 'LatoRegular'),
                ))
          ],
        ));
  }
}
