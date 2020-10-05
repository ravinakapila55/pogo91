import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class ShoppingCartRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: double.infinity,
      height: 90,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Constants.home_light_grey,
          border: Border.all(color: Constants.home_light_grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Row(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Fortune Refund,400gm",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: 'LatoRegular'),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "500",
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
                                    Text(
                                      "400",
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
              ],
            ),
            flex: 3,
          ),
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Container(
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
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'LatoRegular'),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Image.asset(
                          icCartAdd,
                          width: 20,
                          height: 17,
                          color: Colors.white,
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
