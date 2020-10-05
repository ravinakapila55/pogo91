import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/edit_text.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/utils/strings.dart';

class SaveUserInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          EditText(
            hint: first_name,
            marginTop: 0,
          ),
          EditText(
            hint: last_name,
            marginTop: 10,
          ),
          EditText(
            hint: email_opt,
            marginTop: 10,
          ),
          ButtonRegular(
            label: save,
          ),
          TextFieldRegular(
            label: myAddress,
          ),
          ButtonRegular(
            label: plus_add_address,
          )
        ],
      ),
    ));
  }
}
