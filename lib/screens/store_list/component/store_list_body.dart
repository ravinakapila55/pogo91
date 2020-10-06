import 'package:flutter/material.dart';
import 'package:pogo91/screens/store_list/component/banner.dart';
import 'package:pogo91/screens/store_list/component/shop_add_banner.dart';
import 'package:pogo91/screens/store_list/component/store.dart';
import 'package:pogo91/screens/store_list/component/store_category.dart';
import 'package:pogo91/screens/store_list/component/store_header.dart';
import 'package:pogo91/screens/register/component/background.dart';

class StoreListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
                height: 130.0,
                child: new ListView(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    BannerImage(),
                    BannerImage(),
                    BannerImage(),
                  ],
                )),
            StoreHeader("Shop Type", "View All"),
            new Container(
                margin: EdgeInsets.only(top: 20),
                height: 110.0,
                child: new ListView(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    StoreCategory(),
                    StoreCategory(),
                    StoreCategory(),
                    StoreCategory(),
                    StoreCategory(),
                    StoreCategory(),
                  ],
                )),
            StoreHeader("Top Offers", "View All"),
            new Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 90.0,
                child: new ListView(
                  padding: EdgeInsets.only(right: 5.0, left: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    StoreView(),
                    StoreView(),
                    StoreView(),
                    StoreView(),
                  ],
                )),
            ShopAddBanner(),
          ],
        ),
      ),
    );
  }
}
/*,* */
