import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/view/cart/cart_screen.dart';
import 'package:pogo91/view/shop_desc/shop_description_screen.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class StoreSingleInfoItem extends StatelessWidget {
  bool imgShopVisible;
  bool isDeleteIconVisible;
  bool isCallCart;
  StoreSingleInfoItem(bool imgShopVisible,
      {this.isDeleteIconVisible: false, this.isCallCart: false}) {
    this.imgShopVisible = imgShopVisible;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isCallCart
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartProduct()),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopDescription()),
            ), // handle your onTap here
      child: Container(
        width: double.infinity,
        height: 90,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            color: homeLightGrey,
            border: Border.all(color: homeLightGrey),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          children: [
            Visibility(
              visible: imgShopVisible,
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: 55,
                height: 55,
                child: Image.asset(
                  kOTPMessage,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "30% on groceries",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontFamily: 'LatoRegular'),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Raju Kirana Store",
                        style: TextStyle(
                            fontSize: 14,
                            color: redColor,
                            fontFamily: 'LatoRegular'),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  kRatingImage,
                                  width: 8,
                                  height: 8,
                                ),
                                Text(
                                  "5.0",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      color: Constants.login_grey,
                                      fontFamily: 'LatoRegular'),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    kRatingImage,
                                    width: 8,
                                    height: 8,
                                  ),
                                  Text(
                                    "2.5km",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                        color: Constants.login_grey,
                                        fontFamily: 'LatoRegular'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              flex: 4,
            ),
            Expanded(
              child: Visibility(
                visible: isDeleteIconVisible,
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: orangeColor,
                      ),
                      NormalTextField(
                        label: "1 items",
                        textColor: orangeColor,
                        textSize: 8,
                      )
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
