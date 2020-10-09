import 'package:flutter/material.dart';
import 'package:pogo91/screens/store_list/component/store_list_body.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Don't show the leading button
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => null,
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
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () => onClickSearch(context),
              icon: Icon(Icons.search, color: searchIconColor),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StoreListing(),
      backgroundColor: Colors.white,
    );
  }

  void onClickSearch(BuildContext context) {
    Navigator.pushNamed(context, NAV_SEARCH);
  }
}

// new Scaffold(
// body: StoreListing(),
// )
