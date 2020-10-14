import 'package:flutter/material.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBar.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBarItem.dart';
import 'package:pogo91/model/business_type.dart';
import 'package:pogo91/model/store_model.dart';
import 'package:pogo91/view/register/component/background.dart';
import 'package:pogo91/view/store_list/component/banner.dart';
import 'package:pogo91/view/store_list/component/shop_add_banner.dart';
import 'package:pogo91/view/store_list_selected/component/store_single_info_item.dart';
import 'package:pogo91/view/store_list_selected/component/store_title.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/view/store_list_selected/store_list_contract.dart';
import 'package:pogo91/view/store_list_selected/store_presenter.dart';
import 'package:shimmer/shimmer.dart';

class StoreList extends StatefulWidget {
  StoreList_ createState() => StoreList_();
}

class StoreList_ extends State<StoreList> implements StoreListContract {
  List<StoreModel> stores = List();
  StorePresenter _presenter;

  StoreList_() {
    _presenter = new StorePresenter(this);
  }
  BusinessType args;
  @override
  Widget build(BuildContext context) {
    if (args == null) {
      args = ModalRoute.of(context).settings.arguments;
      _presenter.loadStore(args.id.toString());
    }
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
      body: getBody(),
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

// Widget Body Frame
  Widget getBody() {
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
              child: setupStoresWidget(),
            ),
            ShopAddBanner(),
          ],
        ),
      ),
    );
  }

  /// Stores List

  Widget setupStoresWidget() {
    if (stores.length == 0) {
      return setupStoresShimmerWidget();
    } else {
      return Container(
        child: ListView.builder(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: stores.length,
            itemBuilder: (context, index) {
              return StoreSingleInfoItem(
                false,
                storeInfo: stores[index],
              );
            }),
      );
    }
  }

  Widget setupStoresShimmerWidget() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
              color: homeLightGrey,
              border: Border.all(color: homeLightGrey),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        width: 70,
                        height: 70.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  void onStoreList(List<StoreModel> stores) {
    setState(() {
      this.stores = stores;
    });
  }

  @override
  void showError(String message) {}
}
