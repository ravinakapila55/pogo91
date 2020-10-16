import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBar.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBarItem.dart';
import 'package:pogo91/model/location.dart';
import 'package:pogo91/util/preferences.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';
import 'package:pogo91/view/account/customer_profile.dart';
import 'package:pogo91/view/my_favorite_store/my_favorite_store_screen.dart';
import 'package:pogo91/view/store_carts/store_cart_screen.dart';
import 'package:pogo91/view/store_list/home_screen/home_screen.dart';
import 'package:pogo91/utils/colors.dart';
import 'dart:io' show Platform;

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreen createState() => _MainHomeScreen();
}

class _MainHomeScreen extends State<MainHomeScreen> {
  final int navHomeScreen = 1;
  final int navAccountScreen = 2;
  final int navFavoriteStore = 3;
  final int navStoreCart = 4;

  String _address = "";
  int screenNav = 1;

  bool homeScreenAppBar = true;
  @override
  void initState() {
    super.initState();
    permissionCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar
          ? AppBar(
              automaticallyImplyLeading: false, // Don't show the leading button
              titleSpacing: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      onPressed: () => null,
                      icon:
                          ImageIcon(AssetImage(kGPSImage), color: Colors.black),
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
                    onPressed: () => navigateSearchScreen(context),
                    icon: Icon(Icons.search, color: searchIconColor),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 0.0,
            )
          : null,
      body: getHomeScreen(),
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
                color: yellow,
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
        backgroundColor: yellow,
        onTabSelected: (value) => {
          if (value == 0)
            {navigateHomeScreen()}
          else if (value == 1)
            {navigateFavoriteStoreScreen()}
          else if (value == 2)
            {navigateStoreCartScreen()}
          else if (value == 3)
            {navigateAccountScreen()}
        },
        selectedColor: Colors.white,
        items: [
          FABBottomAppBarItem(
            iconData: Icons.home,
          ),
          FABBottomAppBarItem(iconData: Icons.rate_review),
          FABBottomAppBarItem(iconData: Icons.create_new_folder),
          FABBottomAppBarItem(iconData: Icons.supervised_user_circle),
        ],
      ),
    );
  }

  void navigateAccountScreen() {
    setState(() {
      homeScreenAppBar = false;
      screenNav = navAccountScreen;
    });
  }

  void navigateHomeScreen() {
    print("Call Home Screen");

    setState(() {
      homeScreenAppBar = true;

      screenNav = navHomeScreen;
    });
  }

  void navigateFavoriteStoreScreen() {
    setState(() {
      homeScreenAppBar = false;

      screenNav = navFavoriteStore;
    });
  }

  void navigateStoreCartScreen() {
    setState(() {
      homeScreenAppBar = false;
      screenNav = navStoreCart;
    });
  }

  void navigateSearchScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      NAV_SEARCH,
      arguments: "14",
    );
  }

  Widget getHomeScreen() {
    if (screenNav == navHomeScreen) {
      return HomeScreen();
    } else if (screenNav == navAccountScreen) {
      return CustomerProfile();
    } else if (screenNav == navFavoriteStore) {
      return MyFavoriteStoreScreen(() => navigateHomeScreen());
    } else if (screenNav == navStoreCart) {
      return StoreCartScreen(() => navigateHomeScreen());
    }
  }

  //<--------------- User Location ----------------------->
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
      Location location = Location();
      location.address = first.addressLine;
      location.latitude = position.latitude;
      location.longitude = position.longitude;
      Preferences().setLocation(location);
    });
    return position;
  }
}
