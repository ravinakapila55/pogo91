import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pogo91/controller/home_controller.dart';
import 'package:pogo91/view/store_list/component/store_list_body.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen_ createState() => _HomeScreen_();
}

class _HomeScreen_ extends State<HomeScreen> {
  HomeController homeController;

  String _address = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = new HomeController();
    homeController.getBusiness();
    permissionCheck();
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
      body: StoreListing(),
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
}

// new Scaffold(
// body: StoreListing(),
// )
