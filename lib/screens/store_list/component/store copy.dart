import 'package:flutter/material.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class StoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: Constants.yellow,
            border: Border.all(color: Constants.login_grey),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                kOTPMessage,
                width: 55,
                height: 55,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "30% on groceries",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: 'LatoRegular'),
                ),
                Text(
                  "Raju Kirana Store",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Constants.home_grey,
                      fontFamily: 'LatoRegular'),
                ),
                Row(
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
                )
              ],
            )
          ],
        ));
  }
}
