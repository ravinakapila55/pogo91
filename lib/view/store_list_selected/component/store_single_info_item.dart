import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/default_image.dart';
import 'package:pogo91/model/store_model.dart';
import 'package:pogo91/utils/strings.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';

class StoreSingleInfoItem extends StatelessWidget {
  bool imgShopVisible;
  bool isDeleteIconVisible;
  bool isCallCart;
  StoreModel storeInfo;
  StoreSingleInfoItem(bool imgShopVisible,
      {this.isDeleteIconVisible: false,
      this.isCallCart: false,
      this.storeInfo}) {
    this.imgShopVisible = imgShopVisible;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          NAV_SHOP_DESC,
          arguments: storeInfo,
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            color: homeLightGrey,
            border: Border.all(color: homeLightGrey),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          children: [
            Visibility(
              visible:
                  (storeInfo.logo_url == null || storeInfo.logo_url.length == 0)
                      ? false
                      : true,
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: 55,
                height: 55,
                child: DefaultImage().getImageView(storeInfo.logo_url),
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
                        storeInfo.offer,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontFamily: 'LatoRegular'),
                      ),
                    ),
                    Container(
                      child: Text(
                        storeInfo.business_name,
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
                                  " " + storeInfo.rating.toString(),
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
                                    " " + storeInfo.distance.toString() + " Km",
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
            Visibility(
                visible: isDeleteIconVisible,
                child: Expanded(
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
                  flex: 1,
                )),
          ],
        ),
      ),
    );
  }
}
