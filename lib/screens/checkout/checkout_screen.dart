import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/screens/checkout/component/checkout_body.dart';
import 'package:pogo91/utils/box_decoration/top_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutBody(),
      appBar: AppBar(
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
            flex: 3,
          )
        ],
      ),
    );
  }
}
