import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class ShoppingCartRow extends StatelessWidget {
  bool isCloseIconVisible;
  Color iconTextColor;
  ShoppingCartRow(
      {this.isCloseIconVisible: false, this.iconTextColor: Colors.white});

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: greyLightColor),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Visibility(
              visible: isCloseIconVisible,
              child: Icon(
                Icons.close,
              )),
          Container(
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
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldRegular(
                    marginTop: 0,
                    label: "Fortune Refund, 4kg",
                    textSize: 13,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          NormalTextField(
                            label: "₹500",
                            textDecoration: TextDecoration.lineThrough,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: NormalTextField(
                              label: "₹400",
                              textColor: Colors.black,
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
            flex: 2,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Constants.yellow,
                      border: Border.all(color: Constants.yellow),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          icCartRemove,
                          width: 25,
                          height: 25,
                          color: iconTextColor,
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: iconTextColor,
                              fontFamily: 'LatoRegular'),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Image.asset(
                          icCartAdd,
                          width: 25,
                          height: 25,
                          color: iconTextColor,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
