import 'package:flutter/material.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBar.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBarItem.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/view/search/component/search_body.dart';
import 'package:pogo91/utils/constants.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          automaticallyImplyLeading: true, // Don't show the leading button
          titleSpacing: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NormalTextField(
                textColor: Colors.black,
                label: "Hi, Hitashi Garg",
                textSize: 13,
              ),
              NormalTextField(
                textColor: Colors.black,
                label: "C1-501, Cherry County, Tech Zone..",
                textSize: 13,
              )
              // Your widgets here
            ],
          ),

          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SearchBody(),
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
        ));
  }
}
