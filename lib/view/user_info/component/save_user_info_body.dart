import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/edit_text.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/strings.dart';

class SaveUserInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.only(top: 84),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          EditText(
            hint: first_name,
            marginTop: 0,
          ),
          EditText(
            hint: last_name,
            marginTop: 17,
          ),
          EditText(
            hint: email_opt,
            marginTop: 17,
          ),
          ButtonRegular(
            decoration: YellowSolidShadow().getDecoration(),
            marginTop: 40,
            textSize: 16,
            label: save,
            onPressedButton: () => onClickSave(context),
          ),
          TextFieldRegular(
            textSize: 14,
            marginTop: 49,
            label: myAddress,
          ),
          ButtonRegular(
            onPressedButton: () => onClickAddAddresses(context),
            decoration: YellowSolidShadow().getDecoration(),
            textSize: 16,
            marginTop: 20,
            label: plus_add_address,
          )
        ],
      ),
    ));
  }

  void onClickSave(BuildContext context) {
    Navigator.pushNamed(context, NAV_USER_ADDRESSES);
  }

  void onClickAddAddresses(BuildContext context) {
    Navigator.pushNamed(context, NAV_USER_ADDRESSES);
    Navigator.pushNamed(context, NAV_PLACE_PICKER);
  }
}
