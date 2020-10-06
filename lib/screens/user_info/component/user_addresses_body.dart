import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
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
                    ),
                    TextFieldRegular(
                      label: "hitashigarg123@gmail.com",
                      marginTop: 5,
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
