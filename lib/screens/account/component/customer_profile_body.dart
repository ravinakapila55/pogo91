import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/screens/register/component/background.dart';
import 'package:pogo91/utils/box_decoration/button_grey_background_shadow_account.dart';
import 'package:pogo91/utils/box_decoration/button_grey_bottom_border_background_shadow_account.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class CustomerProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    TextFieldRegular(
                      marginTop: 24,
                      label: "Hi Hitashi Garg",
                      textSize: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Expanded(
                          child: TextFieldRegular(
                            label: "9888064115",
                            textSize: 12,
                            marginTop: 9,
                          ),
                          flex: 1,
                        ),
                        new Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: double.infinity,
                            child: TextFieldRegular(
                              textSize: 12,
                              label: "ankit@gmail.com",
                              marginTop: 9,
                              textAligment: Alignment.centerRight,
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              cellView(refer_and_earn_rewards,
                  isBorderVisible: true, marginTop: 33),
              cellView(past_orders, isBorderVisible: true),
              cellView(my_account, isBorderVisible: true),
              cellView(reward_points),
              cellView(active_carts, marginTop: 20, isBorderVisible: true),
              cellView(language),
              cellView(customer_support, marginTop: 20),
              logoutView(signout, marginTop: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget cellView(String title,
      {bool isBorderVisible: false, double marginTop: 0}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: marginTop),
      decoration: ButtonGreyBackgroundShadowAccount().getBorderShow(),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: isBorderVisible
            ? ButtonGreyBottomBorderBackgroundShadowAccount().getBorderShow()
            : ButtonGreyBackgroundShadowAccount().getBorderShow(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalTextField(
              textColor: Colors.black,
              label: title,
            ),
            Icon(
              Icons.arrow_right,
              color: greyColor,
            )
          ],
        ),
      ),
    );
  }

  Widget logoutView(String title,
      {bool isBorderVisible: false, double marginTop: 0}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: marginTop),
      decoration: ButtonGreyBackgroundShadowAccount().getBorderShow(),
      child: TextFieldRegular(
        marginTop: 0,
        textColor: logoutColorAcount,
        textAligment: Alignment.center,
        label: title,
      ),
    );
  }
}
