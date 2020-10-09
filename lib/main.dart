import 'package:flutter/material.dart';
import 'package:pogo91/screens/checkout/component/checkout_screen.dart';
import 'package:pogo91/screens/main_screen.dart';
import 'package:pogo91/screens/past_orders/past_order_screen.dart';
import 'package:pogo91/screens/product_details/product_details_screen.dart';
import 'package:pogo91/screens/register/login_screen.dart';
import 'package:pogo91/screens/register/otp_screen.dart';
import 'package:pogo91/screens/search/search_screen.dart';
import 'package:pogo91/screens/store_list/all_shops_screen.dart';
import 'package:pogo91/screens/success_order/book_order_successfully_screen.dart';
import 'package:pogo91/screens/tutorial/tutorial_screen.dart';
import 'package:pogo91/screens/user_info/place_picker.dart';
import 'package:pogo91/screens/user_info/save_address.dart';
import 'package:pogo91/screens/user_info/save_user_info.dart';
import 'package:pogo91/screens/user_info/user_addresses.dart';
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
        title: 'Flutter Auth',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: NAV_TUTORIAL_SCREEN,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case NAV_CHECKOUTSCREEN:
              return MaterialPageRoute(
                  settings: RouteSettings(
                      name: NAV_CHECKOUTSCREEN, arguments: Map()), // (1)
                  builder: (_) => CheckoutScreen());
              break;
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
          NAV_PRODUCT_DETAIL: (context) => ProductScreen()
        });
  }
}
