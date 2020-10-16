import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/view/register/component/background.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';

class ProductDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(child: getDetails());
  }

  Widget getDetails() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                kBannerImage,
                width: 180,
                fit: BoxFit.cover,
                height: 180,
              ),
            ),
            TextFieldRegular(
              textSize: 17,
              label: "Fortune Refund Oil, 500gm",
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(5),
              decoration: YellowSolidShadow().getDecoration(),
              child: NormalTextField(
                label: "500gm",
                textSize: 14,
                textColor: Colors.white,
              ),
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
              ),
            ),
            TextFieldRegular(
              marginTop: 76,
              label:
                  "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced.",
            ),
            Container(
              margin: EdgeInsets.only(top: 52),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalTextField(
                        label: "Total Price",
                        textColor: homeGreyColor,
                        textSize: 12,
                      ),
                      NormalTextField(
                        label: "₹450",
                        textColor: Colors.black,
                      )
                    ],
                  ),
                  Container(
                    height: 42,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: darkYellow,
                      border: Border.all(color: darkYellow),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(21),
                          bottomRight: Radius.circular(21)),
                    ),
                    child: Row(
                      children: [
                        NormalTextField(
                            label: "Add to Cart", textColor: Colors.white),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
