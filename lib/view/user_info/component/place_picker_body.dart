import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/grey_solid_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';
import 'dart:io' show Platform;

class PlacePickerBody extends StatefulWidget {
  @override
  _PlacePickerBody createState() => _PlacePickerBody();
}

class _PlacePickerBody extends State<PlacePickerBody> {
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _center = const LatLng(45.343434, -122.545454);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  String _title = "";
  String _detail = "";

  TextEditingController _lane1;
  TextEditingController _lane2;
  TextEditingController _lane3;

  LatLng oldPosition;
  Timer timer;
  @override
  void initState() {
    super.initState();
    _lane1 = new TextEditingController();
    _getUserLocation();

    timer = Timer.periodic(Duration(seconds: 2), (_) {
      setUserAddress();
    });
  }

  setUserAddress() async {
    if (oldPosition != null &&
        oldPosition.latitude != _lastMapPosition.latitude &&
        oldPosition.longitude != _lastMapPosition.longitude) {
      oldPosition = _lastMapPosition;
      getUserLocation(Coordinates(oldPosition.latitude, oldPosition.longitude));
    }
  }

  setCurrentLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitRipple(
      borderWidth: 60,
      color: Colors.blue,
      size: 120.0,
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              //              myLocationEnabled: true,
              //              myLocationButtonEnabled:true,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 11.0),
              markers: _markers,
              mapType: _currentMapType,
              onCameraMove: _onCameraMove,
            ),
            Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    spinkit,
                    Image.asset(
                      icGPS,
                      fit: BoxFit.fill,
                      width: 40,
                      height: 40,
                    ),
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 220,
                  color: Colors.white,
                  child: Column(
                    children: [
                      TextFieldRegular(
                        label: "Location",
                        marginTop: 15,
                        textSize: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFieldBold(
                                  label: _title,
                                  textSize: 15,
                                ),
                                TextFieldRegular(
                                  
                                  textSize: 10,
                                  label: _detail,
                                  marginTop: 9,
                                ),
                              ],
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 27,
                              child: ButtonRegular(
                                marginTop: 0,
                                label: "Change",
                                decoration: GreySolidShadow().getBorderShow(),
                                textSize: 10,
                              ),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                      ButtonRegular(
                        onPressedButton: () => onClickConfirmLocation(context),
                        label: "Confirm Location & Proceed",
                        decoration: YellowSolidShadow().getDecoration(),
                        textSize: 16,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        //      floatingActionButton: FloatingActionButton.extended(
        //        onPressed: _goToTheLake,
        //        label: Text('To the lake!'),
        //        icon: Icon(Icons.directions_boat),
        //      ),
      ),
    );
  }

  void onClickConfirmLocation(BuildContext context) {
    Navigator.pushNamed(context, NAV_SAVE_ADDRESSES);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    print("MMMVVV " + _lastMapPosition.latitude.toString());
  }

  _getLocation(LatLng point) async {
    final coordinates = new Coordinates(point.latitude, point.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    setState(() {
      _title = first.featureName;
      _detail = first.addressLine;
      _lane1.text = _title + "   " + _detail;
    });
  }

  getUserLocation(Coordinates coordinates) async {
    //call this async method from whereever you need

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    setState(() {
      _title = first.featureName;
      _detail = first.addressLine;
      _lane1.text = _title + "   " + _detail;
    });
  }

  _getUserLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    oldPosition = LatLng(coordinates.latitude, coordinates.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 16),
      ),
    );

    setState(() {
      _title = first.featureName;
      _detail = first.addressLine;
      _lane1.text = _title + "   " + _detail;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
