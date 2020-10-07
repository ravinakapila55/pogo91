import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/edit_text.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/screens/register/component/background.dart';
import 'package:pogo91/utils/box_decoration/dark_grey_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/green_solid_shadow%20copy.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow_wt_radius.dart';
import 'package:pogo91/utils/box_decoration/grey_solid_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class CheckoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      bgColor: bgColor,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              loginButton(),
              new Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 60.0,
                  child: new ListView(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      cardOffers(),
                      cardOffers(),
                      cardOffers(),
                      cardOffers(),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextFieldBold(
                  textColor: Colors.black,
                  label: deliveryOptions,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    new Flexible(
                      child: Container(
                          child: ButtonRegular(
                        marginTop: 5,
                        decoration: DarkGreyBorderShadow().getBorderShow(),
                        textSize: 10,
                        btn_bg: edtBgGreyColor,
                        border_color: edtBorderColor,
                        label: selfPickUp,
                      )),
                      flex: 1,
                    ),
                    new Flexible(
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: ButtonRegular(
                            marginTop: 5,
                            decoration: GreenSolidShadow().getDecoration(),
                            textSize: 10,
                            btn_bg: edtBgGreyColor,
                            border_color: edtBorderColor,
                            label: homeDelivery,
                          )),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: TextFieldBold(
                  label: deliveryInstructions,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: GreyBorderShadowWtRadius().getBorderShow(),
                height: 70,
                padding:
                    EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
                child: EditText(hint: deliveryInstructions),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                decoration: GreyBorderShadow().getBorderShow(),
                child: Column(
                  children: [
                    TextFieldRegular(
                      textSize: 10,
                      marginTop: 0,
                      label: "Price Details",
                    ),
                    Divider(color: Colors.black),
                    getPriceOptions("Total MRP", "₹600"),
                    getPriceOptions("Discount on MRP", "₹600"),
                    getPriceOptions("Coupon Disocunt", "Apply Discount",
                        rightTextColor: redApplyCoupanColor,
                        rightTextBold: true),
                    getPriceOptions("Delivery Charges", "₹600"),
                    Divider(color: Colors.black),
                    getPriceOptions("Total", "₹600", leftTextBold: true),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                child: Text(
                  "You will be earning 50 POGO Points for this purchase",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      color: loginButtonBlueColor,
                      fontFamily: 'LatoRegular'),
                ),
                color: greenColor,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFieldBold(
                  label: paymentOptions,
                  marginTop: 0,
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                  decoration: GreyBorderShadowWtRadius().getBorderShow(),
                  margin: EdgeInsets.only(top: 5),
                  height: 100.0,
                  child: ListView(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      paymentCard(),
                      paymentCard(),
                      paymentCard(),
                      paymentCard(),
                      paymentCard(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

/*
   Login Button
*/

  Widget loginButton() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: DarkGreyBorderShadow().getBorderShow(),
        padding: EdgeInsets.all(10),
        height: 64,
        child: ButtonRegular(
          decoration: YellowBorderShadow().getDecoration(),
          textSize: 12,
          label: loginWithMobileNumber,
          marginTop: 0,
        ));
  }

/*
   Card Offer
*/
  Widget cardOffers() {
    return Container(
      width: 200,
      decoration: DarkGreyBorderShadow().getBorderShow(),
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              child: Image.asset(
                kBannerImage,
                width: 30,
                fit: BoxFit.fill,
                height: 30,
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: NormalTextField(
              textSize: 8,
              textColor: Colors.black,
              label: "10% instant discount using HDFC Credit cards",
            ),
            flex: 5,
          ),
        ],
      ),
    );
  }

/*
   Payment Option
*/
  Widget paymentCard() {
    return Container(
      width: 70,
      height: 70,
      decoration: GreySolidShadow().getBorderShow(),
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.only(left: 5, right: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            kBannerImage,
            fit: BoxFit.fill,
            width: 30,
            height: 30,
          ),
          NormalTextField(
            textSize: 12,
            textColor: Colors.black,
            label: "PayTm",
          ),
        ],
      ),
    );
  }

  /*
  
    Price Options
   */

  Widget getPriceOptions(String leftTitleButton, String rightTitleButton,
      {Color rightTextColor: labelGreyColor,
      bool rightTextBold: false,
      bool leftTextBold: false}) {
    return Container(
        margin: EdgeInsets.only(top: 0),
        height: 40,
        child: Row(
          children: [
            Text(
              leftTitleButton,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontFamily: leftTextBold ? 'LatoBold' : 'LatoRegular'),
            ),
            Spacer(),
            Text(
              rightTitleButton,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 13,
                  color: rightTextColor,
                  fontFamily: rightTextBold ? 'LatoBold' : 'LatoRegular'),
            )
          ],
        ));
  }
}
