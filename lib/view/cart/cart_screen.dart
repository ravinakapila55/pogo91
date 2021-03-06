import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/view/cart/component/cart_body.dart';
import 'package:pogo91/utils/box_decoration/top_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class CartProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cart",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'LatoBold')),
              ],
            )
            // Your widgets here
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.rate_review, color: searchIconColor),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
      body: ProductBody(),
      bottomNavigationBar: Container(
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
              child: Material(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, NAV_CHECKOUTSCREEN), // handle your onTap here
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: darkYellow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: NormalTextField(
                      label: "Checkout",
                      textSize: 15,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
