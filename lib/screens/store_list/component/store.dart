import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class StoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 240,
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: homeLightGrey,
            border: Border.all(color: homeLightGrey),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "30% on groceries",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'LatoRegular'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Raju Kirana Store",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: homeGreyColor,
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
            )
          ],
        ));
  }
}
