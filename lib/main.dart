import 'package:flutter/material.dart';
import 'package:pogo91/splash.dart';
import 'package:pogo91/view/checkout/component/checkout_screen.dart';
import 'package:pogo91/view/main_screen.dart';
import 'package:pogo91/view/past_orders/past_order_screen.dart';
import 'package:pogo91/view/product_details/product_details_screen.dart';
import 'package:pogo91/view/register/login_screen.dart';
import 'package:pogo91/view/register/otp_screen.dart';
import 'package:pogo91/view/search/search_screen.dart';
import 'package:pogo91/view/shop_desc/shop_description_screen.dart';
import 'package:pogo91/view/store_list/all_shops_screen.dart';
import 'package:pogo91/view/store_list_selected/store_list_screen.dart';
import 'package:pogo91/view/success_order/book_order_successfully_screen.dart';
import 'package:pogo91/view/tutorial/tutorial_screen.dart';
import 'package:pogo91/view/user_info/place_picker.dart';
import 'package:pogo91/view/user_info/save_address.dart';
import 'package:pogo91/view/user_info/save_user_info.dart';
import 'package:pogo91/view/user_info/user_addresses.dart';
import 'package:pogo91/utils/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pogo91',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: NAV_SPLASH,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case NAV_CHECKOUTSCREEN:
              return MaterialPageRoute(
                  settings: RouteSettings(
                      name: NAV_CHECKOUTSCREEN, arguments: Map()), // (1)
                  builder: (_) => CheckoutScreen());
              break;
            case NAV_STORE_LIST:
              return MaterialPageRoute(
                  settings: RouteSettings(
                      name: NAV_STORE_LIST,
                      arguments: settings.arguments), // (1)
                  builder: (_) => StoreList());

            case NAV_SHOP_DESC:
              {
                return MaterialPageRoute(
                    settings: RouteSettings(
                        name: NAV_SHOP_DESC,
                        arguments: settings.arguments), // (1)
                    builder: (_) => ShopDescription());
              }

            case NAV_ALL_BUSINESSTYPE:
              {
                return MaterialPageRoute(
                    settings: RouteSettings(
                        name: NAV_SHOP_DESC,
                        arguments: settings.arguments), // (1)
                    builder: (_) => AllShops());
              }
            default:
          }
        },
        routes: {
          NAV_TUTORIAL_SCREEN: (context) => TutorialScreen(),
          // When navigating to the "/" route, build the FirstScreen widget.
          NAV_MAIN_SCREEN: (context) => MainHomeScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          NAV_STORE_LISTING_CATEGORY_SELECTED: (context) => AllShops(),
          NAV_SIGN_UP: (context) => Login(),
          NAV_OTP: (context) => OTP(),
          NAV_SAVE_USER_INFO: (context) => SaveUserInfo(),
          NAV_USER_ADDRESSES: (context) => UserAddresses(),
          NAV_PLACE_PICKER: (context) => PlacePicker(),
          NAV_SAVE_ADDRESSES: (context) => SaveAddress(),
          NAV_SEARCH: (context) => SearchScreen(),
          NAV_ORDER_SUCCESS: (context) => BookSuccessfullyScreen(),
          NAV_HOME_SCREEN: (context) => MainHomeScreen(),
          NAV_PAST_ORDER: (context) => PastOrderScreen(),
          NAV_PRODUCT_DETAIL: (context) => ProductScreen(),
          NAV_STORE_LIST: (context) => StoreList(),
          NAV_SPLASH: (context) => Splash()
        });
  }
}
