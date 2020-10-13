import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';

class StoreLocationToolbar extends AppBar {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true, // Don't show the leading button
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: ImageIcon(AssetImage(kGPSImage), color: Colors.black),
          ),
          Text("C1-501, Mohali ",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'LatoRegular')),

          // Your widgets here
        ],
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Icon(Icons.search, color: searchIconColor),
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}
