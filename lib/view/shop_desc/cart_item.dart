import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/model/price_stock_model.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/utils/box_decoration/edt_grey_decoration.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class ShoppingCartRow extends StatelessWidget {
  bool isCloseIconVisible;
  Color iconTextColor;
  ProductsModel productsModel;
  Widget spinner;
  ShoppingCartRow(
      {this.isCloseIconVisible: false,
      this.iconTextColor: Colors.white,
      this.productsModel,
      this.spinner}) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NAV_PRODUCT_DETAIL);
      },
      child: (Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
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
              width: 70,
              height: 70,
              child: Image.network(
                productsModel.imageUrl,
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
                      label: productsModel.productName + ", ",
                      textSize: 13,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 18),
                        child: Row(
                          children: [
                            Visibility(
                              visible: productsModel.priceStock[0].mrp !=
                                  productsModel.priceStock[0].selling_price,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: NormalTextField(
                                  label: "₹ " + productsModel.priceStock[0].mrp,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            NormalTextField(
                              label: "₹ " +
                                  productsModel.priceStock[0].selling_price,
                              textColor: Colors.black,
                            ),
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
      )),
    );
  }
}
