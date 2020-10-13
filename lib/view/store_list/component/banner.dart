import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pogo91/utils/images.dart';

class BannerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            kBannerImage,
            width: 240,
            height: 120,
            fit: BoxFit.fill,
          ),
        ));
  }
}
