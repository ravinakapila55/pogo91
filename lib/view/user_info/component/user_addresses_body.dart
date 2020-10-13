import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class UserAddressBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.only(top: 84),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Expanded(
                child: Column(
                  children: [
                    TextFieldRegular(
                      label: "Hi Hitashi Garg",
                      textSize: 14,
                    ),
                    TextFieldRegular(
                      label: "hitashigarg123@gmail.com",
                      textSize: 14,
                      marginTop: 13,
                    )
                  ],
                ),
                flex: 3,
              ),
              new Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  child: TextFieldRegular(
                    textSize: 14,
                    label: "Edit",
                    textColor: txtorangeColor,
                    marginTop: 0,
                    textAligment: Alignment.centerRight,
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          TextFieldRegular(
            textSize: 14,
            marginTop: 40,
            label: myAddress,
          ),
          ButtonRegular(
            onPressedButton: () => onClickAddAddress(context),
            decoration: YellowSolidShadow().getDecoration(),
            textSize: 16,
            label: plus_add_address,
          ),
          getWidget(context)
        ],
      ),
    ));
  }

  void onClickAddAddress(BuildContext context) {
    Navigator.pushNamed(context, NAV_PLACE_PICKER);
  }

  Widget getWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectAddress(context);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: GreyBorderShadow()
            .getBorderShow(borderColor: addressScreenDecorationColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NormalTextField(
              textSize: 10,
              textColor: Colors.black,
              label: "Home",
            ),
            NormalTextField(
              textSize: 10,
              textColor: addressScreenDescColor,
              label: "C1-501, Cherry County, Tech Zone 4",
            ),
          ],
        ),
      ),
    );
  }

  void onSelectAddress(BuildContext context) {
    Navigator.of(context).popUntil((route) {
      if (route.settings.name == NAV_CHECKOUTSCREEN) {
        (route.settings.arguments as Map)['item'] = 'LoginSuccess';
        return true;
      } else {
        return false;
      }
    });
  }
}
