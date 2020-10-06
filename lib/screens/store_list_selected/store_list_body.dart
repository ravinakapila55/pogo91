import 'package:flutter/material.dart';
import 'package:pogo91/screens/store_list/component/banner.dart';
import 'package:pogo91/screens/store_list/component/shop_add_banner.dart';
import 'package:pogo91/screens/store_list/component/store_header.dart';
import 'package:pogo91/screens/store_list_selected/component/store_single_info_item.dart';
import 'package:pogo91/screens/store_list_selected/component/store_title.dart';
import 'package:pogo91/screens/register/component/background.dart';

class StoreListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: StoreTitle("Groceries", "")),
            new Container(
                height: 130.0,
                child: new ListView(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    BannerImage(),
                    BannerImage(),
                    BannerImage(),
                  ],
                )),
            new Container(
              child: new ListView(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  StoreSingleInfoItem(true),
                  StoreSingleInfoItem(false),
                  StoreSingleInfoItem(false),
                  StoreSingleInfoItem(false),
                ],
              ),
            ),
            ShopAddBanner(),
          ],
        ),
      ),
    );
  }
}
/*,* */
