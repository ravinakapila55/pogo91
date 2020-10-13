import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBar.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBarItem.dart';
import 'package:pogo91/view/account/customer_profile.dart';
import 'package:pogo91/view/my_favorite_store/my_favorite_store_screen.dart';
import 'package:pogo91/view/store_carts/store_cart_screen.dart';
import 'package:pogo91/view/store_list/home_screen.dart';
import 'package:pogo91/utils/colors.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreen createState() => _MainHomeScreen();
}

class _MainHomeScreen extends State<MainHomeScreen> {
  final int navHomeScreen = 1;
  final int navAccountScreen = 2;
  final int navFavoriteStore = 3;
  final int navStoreCart = 4;


  int screenNav = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      screenNav = navAccountScreen;
    });
  }

  void navigateHomeScreen() {
    print("Call Home Screen");

    setState(() {
      screenNav = navHomeScreen;
    });
  }

  void navigateFavoriteStoreScreen() {
    setState(() {
      screenNav = navFavoriteStore;
    });
  }

  void navigateStoreCartScreen() {
    setState(() {
      screenNav = navStoreCart;
    });
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

 
}
