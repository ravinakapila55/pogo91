import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class BookSuccessfullyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: getSuccessView(),
      bottomNavigationBar: backToHome(context),
    );
  }

  Widget backToHome(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ButtonRegular(
        marginTop: 0,
        decoration: YellowSolidShadow().getDecoration(),
        textSize: 18,
        label: "Back To Home",
        onPressedButton: () => onClickHOme(context),
      ),
    );
  }

  void onClickHOme(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName(NAV_HOME_SCREEN));
  }

  Widget getSuccessView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icCheckIcon,
          fit: BoxFit.fill,
          width: 100,
          height: 100,
        ),
        TextFieldRegular(
          label: successfully,
          textSize: 40,
          textAlign: TextAlign.center,
          textAligment: Alignment.center,
          textColor: orderSuccessTitleColor,
        ),
        TextFieldRegular(
          label: orderSuccessfully,
          textSize: 20,
          textAlign: TextAlign.center,
          textAligment: Alignment.center,
          textColor: orderSuccessDescColor,
        ),
      ],
    );
  }
}
