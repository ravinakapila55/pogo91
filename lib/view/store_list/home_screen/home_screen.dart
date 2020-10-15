import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pogo91/model/business_type.dart';
import 'package:pogo91/view/register/component/background.dart';
import 'package:pogo91/view/store_list/component/banner.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';
import 'dart:io' show Platform;

import 'package:pogo91/view/store_list/component/shop_add_banner.dart';
import 'package:pogo91/view/store_list/component/store.dart';
import 'package:pogo91/view/store_list/component/store_business_type.dart';
import 'package:pogo91/view/store_list/component/store_header.dart';

import 'package:pogo91/view/store_list/home_screen/home_contract.dart';
import 'package:pogo91/view/store_list/home_screen/home_presenter.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen_ createState() => _HomeScreen_();
}

class _HomeScreen_ extends State<HomeScreen> implements HomeContract {
  String _address = "";

  HomePresenter _presenter;
  _HomeScreen_() {
    _presenter = new HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    permissionCheck();
    _presenter.loadBusinessType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Don't show the leading button
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconButton(
                onPressed: () => null,
                icon: ImageIcon(AssetImage(kGPSImage), color: Colors.black),
              ),
              flex: 2,
            ),

            Expanded(
              child: Text(_address,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'LatoRegular')),
              flex: 8,
            )
            // Your widgets here
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () => onClickSearch(context),
              icon: Icon(Icons.search, color: searchIconColor),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: getBody(),
      backgroundColor: Colors.white,
    );
  }

  void onClickSearch(BuildContext context) {
    Navigator.pushNamed(context, NAV_SEARCH);
  }

  permissionCheck() async {
    await checkPermission().then((results) {
      if (results == LocationPermission.always ||
          results == LocationPermission.whileInUse) {
        getCurrentLocation();
      } else {
        callPermission();
      }
    });
  }

  void callPermission() async {
    LocationPermission permission = await requestPermission().then((results) {
      if (results == LocationPermission.always ||
          results == LocationPermission.whileInUse) {
        getCurrentLocation();
      } else {
        if (results == LocationPermission.denied) {
          // Deny only first not for block the permission
          checkPermission();
        } else {
          if (Platform.isAndroid) {
            openAppSettings();
          } else if (Platform.isIOS) {
            // iOS-specific code
            openLocationSettings();
          }
        }
      }
    });
  }

  getCurrentLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude.toString());
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      _address = first.addressLine;
    });
    return position;
  }

  List<BusinessType> businessTypes = List();
  @override
  void onBusinessType(List<BusinessType> businessTypes) {
    setState(() {
      this.businessTypes = businessTypes;
    });
  }

  @override
  void showError(String message) {
    print(message);
  }

  //  Body Widget

  Widget getBody() {
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
            StoreHeader(
              "Shop Type",
              "View All",
              onPressed: () => onClickShopTypeView(context),
            ),
            setupListViewWidget(),
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

  void onClickShopTypeView(BuildContext context) {
    print(businessTypes.length.toString());
    Navigator.pushNamed(
      context,
      NAV_ALL_BUSINESSTYPE,
      arguments: businessTypes,
    );
  }

//  Business Type

  Widget setupListBusinessTypeShimmerWidget() {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            width: 80,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    width: 75.0,
                    height: 75.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: 75.0,
                      height: 20.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: 6,
      ),
    );
  }

  Widget setupListViewWidget() {
    if (businessTypes.length == 0) {
      return setupListBusinessTypeShimmerWidget();
    } else {
      return Container(
        height: 140,
        child: ListView.builder(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            itemCount: businessTypes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StoreBusinessType(
                businessType: businessTypes[index],
              );
            }),
      );
    }
  }
}

// new Scaffold(
// body: StoreListing(),
// )
