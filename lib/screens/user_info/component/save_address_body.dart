import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/edit_text.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class SaveAddressBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 84),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TextFieldRegular(
              label: location,
              marginTop: 20,
            ),
            EditText(
              hint: flat_number_build_number,
              marginTop: 20,
            ),
            EditText(
              hint: floor_optional,
              marginTop: 20,
            ),
            Row(
              children: <Widget>[
                new Flexible(
                  child: Container(
                      child: ButtonRegular(
                    decoration: YellowSolidShadow().getDecoration(),
                    textSize: 10,
                    btn_bg: edtBgGreyColor,
                    border_color: edtBorderColor,
                    label: home,
                  )),
                  flex: 1,
                ),
                new Flexible(
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: ButtonRegular(
                        decoration: YellowSolidShadow().getDecoration(),
                        textSize: 10,
                        btn_bg: edtBgGreyColor,
                        border_color: edtBorderColor,
                        label: office,
                      )),
                  flex: 1,
                ),
                new Flexible(
                  child: Container(
                      child: ButtonRegular(
                    decoration: YellowSolidShadow().getDecoration(),
                    textSize: 10,
                    border_color: edtBorderColor,
                    btn_bg: edtBgGreyColor,
                    label: other,
                  )),
                  flex: 1,
                ),
              ],
            ),
            ButtonRegular(
              decoration: YellowSolidShadow().getDecoration(),
              label: saveAddress,
              onPressedButton: () => onClickSaveAddress(context),
            )
          ],
        ),
      ),
    );
  }

  void onClickSaveAddress(BuildContext context) {
    //   Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => U()));
    //             }
  }
}
