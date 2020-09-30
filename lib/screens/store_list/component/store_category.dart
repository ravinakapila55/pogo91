import 'package:flutter/material.dart';
import 'package:pogo91/utils/images.dart';

class StoreCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  kBannerImage,
                  width: 75,
                  height: 75,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Groceries",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontFamily: 'LatoRegular'),
              ),
            )
          ],
        ));
  }
}
