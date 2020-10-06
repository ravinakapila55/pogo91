import 'package:flutter/material.dart';

class TopBorderShadow {
  BoxDecoration getBorderShow() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10.0, // soften the shadow
          spreadRadius: 5.0, //extend the shadow
          offset: Offset(
            10.0, // Move to right 10  horizontally
            10.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    );
  }
}
