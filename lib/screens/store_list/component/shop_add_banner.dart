import 'package:flutter/material.dart';
import 'package:pogo91/utils/images.dart';

class ShopAddBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            kBannerImage,
            width: double.infinity,
            height: 80,
            fit: BoxFit.fill,
          ),
        ));
  }
}
