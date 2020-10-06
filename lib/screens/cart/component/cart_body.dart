import 'package:flutter/material.dart';
import 'package:pogo91/screens/shop_desc/cart_item.dart';
import 'package:pogo91/utils/colors.dart';

class ProductBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(slivers: <Widget>[
      SliverFixedExtentList(
        itemExtent: 90.0,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ShoppingCartRow(
              isCloseIconVisible: true,
              iconTextColor: darkBlue,
            );
          },
        ),
      )
    ]);
  }
}
