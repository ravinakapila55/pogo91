import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacePickerBody extends StatefulWidget {
  @override
  _PlacePickerBody createState() => _PlacePickerBody();
}

class _PlacePickerBody extends State<PlacePickerBody> {
  var geolocator = Geolocator();
  Position position;
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 11.0,
  );
  CameraPosition _position = _kInitialPosition;
  bool _isMoving = false;
  StreamSubscription _getPositionSubscription;
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, timeInterval: 10);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: new RaisedButton(
              onPressed: _getAddress,
              textColor: Colors.white,
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "GetAddress",
              ),
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/startloc.png',
            height: 60,
            width: 60,
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    // mapController.addListener(_onMapChanged);
    _extractMapInfo();
    setState(() {});
  }

  void _onMapChanged() {
    setState(() {
      _extractMapInfo();
    });
  }

  void _extractMapInfo() {
    //  _position = mapController.cameraPosition;
    print(_position.target.longitude);
    //  _isMoving = mapController.isCameraMoving;
  }

  Future _getAddress() async {
//    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude,position.longitude);
//     print(placemark.elementAt(0).locality);\
    print(_position.target.latitude);
    //  final coordinates = new Coordinates(_position.target.latitude,_position.target.longitude);

    // print(coordinates);

    // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    //  print( addresses.first.addressLine);
  }

  @override
  void dispose() {
    _getPositionSubscription.cancel();
    super.dispose();
  }
}
