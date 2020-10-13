import 'package:flutter/material.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBar.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBarItem.dart';
import 'package:pogo91/view/store_list_selected/store_list_body.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';

class StoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Don't show the leading button
        titleSpacing: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, Hitashi Garg",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'LatoRegular')),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text("C1-501, Cherry County, Tech Zone..",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'LatoRegular')),
                )
              ],
            )
            // Your widgets here
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: searchIconColor),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StoreListBody(),
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                shape: BoxShape.circle,
                color: Constants.yellow,
              ),
              child: Icon(Icons.photo_camera, size: 30),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.white,
        backgroundColor: Constants.yellow,
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(iconData: Icons.home),
          FABBottomAppBarItem(iconData: Icons.rate_review),
          FABBottomAppBarItem(iconData: Icons.create_new_folder),
          FABBottomAppBarItem(iconData: Icons.supervised_user_circle),
        ],
      ),
    );
  }
}
