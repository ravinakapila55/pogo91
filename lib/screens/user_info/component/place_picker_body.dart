import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/grey_solid_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow_50.dart';
import 'package:pogo91/utils/strings.dart';

class PlacePickerBody extends StatefulWidget {
  @override
  _PlacePickerBody createState() => _PlacePickerBody();
}

class _PlacePickerBody extends State<PlacePickerBody> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: double.infinity,
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
                            label: "Cherry County",
                            textSize: 15,
                          ),
                          TextFieldRegular(
                            textSize: 10,
                            label:
                                "Tech Zone IV, Amarpali Dream Valley, Uttarpradesh, 201306, India",
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
          flex: 1,
        )
      ],
    );
  }

  void onClickConfirmLocation(BuildContext context) {
    Navigator.pushNamed(context, NAV_SAVE_ADDRESSES);
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
