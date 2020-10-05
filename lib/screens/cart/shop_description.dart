import 'package:flutter/material.dart';
import 'package:pogo91/screens/cart/cart_item.dart';
import 'package:pogo91/screens/cart/products_category.dart';
import 'package:pogo91/screens/store_list/component/banner.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class ShopDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Raju Kirana Store",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'LatoBold')),
                ],
              )
              // Your widgets here
            ],
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(Icons.rate_review, color: searchIconColor),
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "B64, Sector 64, Noida",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        color: Constants.login_button_blue,
                        fontFamily: 'LatoRegular'),
                  ),
                  Row(
                    children: [
                      Icon(Icons.gps_fixed),
                      Icon(Icons.call),
                      Icon(Icons.message)
                    ],
                  )
                ],
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "4.2 ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 8,
                            color: Constants.login_button_blue,
                            fontFamily: 'LatoRegular'),
                      ),
                      Image.asset(
                        kRatingImage,
                        width: 8,
                        height: 8,
                      ),
                      Text(
                        " (120)",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 8,
                            color: Constants.login_button_blue,
                            fontFamily: 'LatoRegular'),
                      )
                    ],
                  ),
                  Text(
                    "More Info",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 8,
                        color: Constants.yellow,
                        fontFamily: 'LatoRegular'),
                  )
                ],
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Delivery in 4 - 5 hours",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8,
                          color: Constants.login_button_blue,
                          fontFamily: 'LatoRegular'),
                    ),
                    Text(
                      "Free delivery above `1000",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8,
                          color: Constants.login_button_blue,
                          fontFamily: 'LatoRegular'),
                    ),
                    Text(
                      "5 Km Away",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8,
                          color: Constants.login_button_blue,
                          fontFamily: 'LatoRegular'),
                    )
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 120,
                child: ListView(
                  padding: EdgeInsets.only(right: 5.0, left: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    BannerImage(),
                    BannerImage(),
                    BannerImage(),
                    BannerImage(),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              child: Text(
                "Earn 1 POGO Points for every `100 you spend",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Constants.login_button_blue,
                    fontFamily: 'LatoRegular'),
              ),
              color: greenColor,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: greyLightColor,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "All Categories",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        color: Constants.login_button_blue,
                        fontFamily: 'LatoRegular'),
                  ),
                  Row(
                    children: [Icon(Icons.scanner), Icon(Icons.search)],
                  )
                ],
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 40,
                child: ListView(
                  padding: EdgeInsets.only(right: 5.0, left: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ProductCategroyTab(),
                    ProductCategroyTab(),
                    ProductCategroyTab(),
                    ProductCategroyTab(),
                  ],
                )),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ShoppingCartRow();
              },
            ),
          ),
        ]));
  }
}
