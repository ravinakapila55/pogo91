import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  IconData iconData;
  double marginLeft;
  double marginRight;
  Color backGroundColor;
  ImageButton(
      {@required this.iconData,
      this.marginLeft: 0,
      this.marginRight: 0,
      this.backGroundColor: Colors.white});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(5),
      child: Icon(iconData),
    );
  }
}
