import 'package:flutter/material.dart';
import 'package:pogo91/view/store_list/all_shops_screen.dart';
import 'package:pogo91/utils/colors.dart';

class StoreTitle extends StatelessWidget {
  String leftTitleButton;
  String rightTitleButton;

  StoreTitle(String leftTitleButton, String rightTitleButton) {
    this.leftTitleButton = leftTitleButton;
    this.rightTitleButton = rightTitleButton;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          children: [
            Text(
              leftTitleButton,
              style: TextStyle(
                  fontSize: 15, color: Colors.black, fontFamily: 'LatoRegular'),
            ),
            Spacer(),
            new InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllShops()));
                },
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
