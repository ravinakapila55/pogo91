import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/edt_grey_decoration.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            searchBar(),
            TextFieldRegular(
              label: recentlySearched,
              textColor: searchTextColor,
              textSize: 12,
            )
          ],
        ),
      ),
    );
  }

  // Search View

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: EdtDecoration().getDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              style: new TextStyle(color: Colors.black, fontSize: 12),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: new Icon(Icons.search, color: searchIconColor),
                  hintText: "Search Product, Shops, Drinks",
                  hintStyle: new TextStyle(color: searchIconColor)),
            ),
            flex: 7,
          ),
          Expanded(
            child: Icon(
              Icons.camera,
              color: searchIconColor,
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
