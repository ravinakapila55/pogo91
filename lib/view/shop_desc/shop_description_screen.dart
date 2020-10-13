import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/image_button.dart';
import 'package:pogo91/view/cart/cart_screen.dart';
import 'package:pogo91/view/shop_desc/cart_item.dart';
import 'package:pogo91/view/shop_desc/products_category.dart';
import 'package:pogo91/view/store_list/component/banner.dart';
import 'package:pogo91/utils/box_decoration/circle_grey_widget.dart';
import 'package:pogo91/utils/box_decoration/top_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class ShopDescription extends StatelessWidget {
  final List<String> _tabs = ['Tab 1', 'Tab 2'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: headerView(),
            ),
            SliverAppBar(
              automaticallyImplyLeading: true,
              elevation: 0,
              backgroundColor: greyLightColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: getHeader(),
              ),
              pinned: true,
            ),
            SliverPadding(
              padding: new EdgeInsets.all(2.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate([getCategory()]),
              ),
            ),
          ];
        },
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 90,
                child: ShoppingCartRow(),
              );
            }),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: TopBorderShadow().getBorderShow(),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.search),
                  NormalTextField(
                    label: "Sort",
                    textSize: 9,
                    textColor: Colors.black,
                  )
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  NormalTextField(
                    label: "Filter",
                    textSize: 9,
                    textColor: Colors.black,
                  )
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartProduct()),
                ), // handle your onTap here

                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalTextField(
                              label: "₹0",
                              textSize: 14,
                              textColor: Colors.white,
                            ),
                            NormalTextField(
                              label: "Checkout",
                              textSize: 9,
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

// Store Basis Info

  Widget headerView() {
    return Column(
      children: [
        Container(
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
                    color: loginButtonBlueColor,
                    fontFamily: 'LatoRegular'),
              ),
              Row(
                children: [
                  ImageButton(
                    iconData: Icons.gps_fixed,
                    marginRight: 5,
                    backGroundColor: greyButtonColor,
                  ),
                  ImageButton(
                    iconData: Icons.call,
                    marginRight: 5,
                    backGroundColor: greyButtonColor,
                  ),
                  ImageButton(
                    iconData: Icons.message,
                    backGroundColor: greyButtonColor,
                  )
                ],
              )
            ],
          )),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  NormalTextField(
                    label: "4.2  ",
                    textSize: 8,
                    textColor: Colors.black,
                  ),
                  Image.asset(
                    kRatingImage,
                    width: 8,
                    height: 8,
                    color: yellow,
                  ),
                  NormalTextField(
                    label: " (120)",
                    textSize: 8,
                    textColor: Colors.black,
                  ),
                ],
              ),
              NormalTextField(
                label: "More Info",
                textSize: 8,
                textColor: yellow,
              ),
            ],
          )),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NormalTextField(
                label: "Delivery in 4 - 5 hours",
                textSize: 8,
                textColor: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleGreyDecoration().getRoundedWidget(),
                  NormalTextField(
                    label: "Free delivery above `1000",
                    textSize: 8,
                    textColor: Colors.black,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleGreyDecoration().getRoundedWidget(),
                  NormalTextField(
                    label: "5 Km Away",
                    textSize: 8,
                    textColor: Colors.black,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          color: greyLightColor,
          height: 120,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: ListView(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              BannerImage(),
              BannerImage(),
              BannerImage(),
              BannerImage(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            "Earn 1 POGO Points for every ₹100 you spend",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10,
                color: loginButtonBlueColor,
                fontFamily: 'LatoRegular'),
          ),
          color: greenColor,
        )
      ],
    );
  }

// Tab button or Categories of product
  Widget getCategory() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: greyLightColor),
            ),
            color: Colors.white,
          ),
          height: 40,
          child: ListView(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ProductCategroyTab(
                isTabSelected: true,
              ),
              ProductCategroyTab(),
              ProductCategroyTab(),
              ProductCategroyTab(),
            ],
          ),
        ),
      ],
    );
    //
  }

// Search bar
  Widget getHeader() {
    return Container(
        color: greyLightColor,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: NormalTextField(
                textColor: Colors.black,
                label: allCategories,
                textSize: 12,
              ),
            ),
            Row(
              children: [
                ImageButton(
                  iconData: Icons.scanner,
                  marginRight: 10,
                ),
                ImageButton(iconData: Icons.search)
              ],
            ),
          ],
        )));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}