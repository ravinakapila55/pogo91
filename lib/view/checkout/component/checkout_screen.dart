import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/edit_text.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/view/register/component/background.dart';
import 'package:pogo91/view/register/login_screen.dart';
import 'package:pogo91/utils/box_decoration/dark_grey_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/green_solid_shadow%20copy.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow_wt_radius.dart';
import 'package:pogo91/utils/box_decoration/grey_solid_shadow.dart';
import 'package:pogo91/utils/box_decoration/top_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutBody createState() => _CheckoutBody();
}

class _CheckoutBody extends State<CheckoutScreen> {
  bool isLoginUser = false;
  bool isOrderType = false;
  final bool boolSelfPickUp = false;
  final bool boolHomeDelivery = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoginUser = false;
    isOrderType = boolSelfPickUp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Checkout",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'LatoBold')),
              ],
            )
            // Your widgets here
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(),
    );
    ;
  }

  /*
  Bottom Bar 
*/
  Widget getBottomBar() {
    return Container(
      decoration: TopBorderShadow().getBorderShow(),
      height: 65,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Row(
        children: [
          Expanded(
            child: NormalTextField(
              label: "₹530",
              textSize: 15,
              textColor: Colors.black,
            ),
            flex: 2,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (isLoginUser) {
                  Navigator.pushNamed(context, NAV_ORDER_SUCCESS);
                } else {
                  onClickPressLoginButton(context);
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: darkYellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: NormalTextField(
                    label: "Place Order",
                    textSize: 15,
                    textColor: Colors.black,
                  )),
            ),
            flex: 3,
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return Background(
      bgColor: bgColor,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              isLoginUser ? userInfo(context) : loginButton(context),
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
                        decoration: isOrderType
                            ? DarkGreyBorderShadow().getBorderShow()
                            : GreenSolidShadow().getDecoration(),
                        textSize: 10,
                        onPressedButton: () => onClickStorePickup(),
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
                            decoration: isOrderType
                                ? GreenSolidShadow().getDecoration()
                                : DarkGreyBorderShadow().getBorderShow(),
                            textSize: 10,
                            onPressedButton: () => onClickOrderHomeDelivery(),
                            btn_bg: edtBgGreyColor,
                            border_color: edtBorderColor,
                            label: homeDelivery,
                          )),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isOrderType,
                child: Column(
                  children: [
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
                      padding: EdgeInsets.only(
                          top: 10, right: 15, left: 15, bottom: 10),
                      child: EditText(hint: deliveryInstructions),
                    ),
                  ],
                ),
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

  void onClickOrderHomeDelivery() {
    setState(() {
      isOrderType = boolHomeDelivery;
    });
  }

  void onClickStorePickup() {
    setState(() {
      isOrderType = boolSelfPickUp;
    });
  }

/*
   Login Button
*/

  Widget loginButton(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: DarkGreyBorderShadow().getBorderShow(),
        padding: EdgeInsets.all(10),
        height: 64,
        child: ButtonRegular(
          onPressedButton: () => onClickPressLoginButton(context),
          decoration: YellowBorderShadow().getDecoration(),
          textSize: 12,
          label: loginWithMobileNumber,
          marginTop: 0,
        ));
  }

  Widget userInfo(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: DarkGreyBorderShadow().getBorderShow(),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextFieldBold(
                        marginTop: 0,
                        label: "Hitashi Garg",
                        textSize: 10,
                      ),
                      TextFieldRegular(
                        textSize: 10,
                        label: "C1-501, Cherry County, Tech Zone 4",
                        marginTop: 0,
                      ),
                    ],
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: TextFieldBold(
                      marginTop: 0,
                      label: "Mobile - 97112200999",
                      textSize: 10,
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
            Container(
              height: 32,
              margin: EdgeInsets.only(top: 10),
              child: ButtonRegular(
                decoration: YellowBorderShadow().getDecoration(),
                textSize: 11,
                label: "Change or Add Address",
                marginTop: 0,
              ),
            ),
          ],
        ));
  }

  Future onClickPressLoginButton(BuildContext context) async {
    Navigator.of(context).pushNamed(NAV_SIGN_UP).then((results) {
      final arguments = ModalRoute.of(context).settings.arguments as Map;
      final result = arguments['item'];
      if (result.toString() == "LoginSuccess") {
        setState(() {
          isLoginUser = true;
        });
      }
    });
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
