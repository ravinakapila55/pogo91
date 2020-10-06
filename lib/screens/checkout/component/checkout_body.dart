import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/screens/register/component/background.dart';
import 'package:pogo91/screens/store_list/component/banner.dart';
import 'package:pogo91/utils/strings.dart';

class CheckoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Background(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              loginButton(),
              Row(
                children: [
                  BannerImage(),
                ],
              ),
              TextFieldRegular(
                textColor: Colors.black,
                label: "Delivery Options",
              ),
              TextFieldRegular(
                label: "Delivery Instructions",
              ),
              TextFieldRegular(
                label: "Price Details",
              ),
              TextFieldRegular(
                label: "Payment Option",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return ButtonRegular(
      textSize: 12,
      label: loginWithMobileNumber,
      marginTop: 18,
    );
  }
}
