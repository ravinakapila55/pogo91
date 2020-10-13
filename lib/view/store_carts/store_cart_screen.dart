import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/view/store_carts/component/store_cart_body.dart';

class StoreCartScreen extends StatelessWidget {
  Function onBackPressed;
  StoreCartScreen(@required this.onBackPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: onBackPressed,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: TextFieldBold(
            marginTop: 0,
            label: "Active Carts",
            textColor: Colors.black,
          )),
      body: StoreCartBody(),
    );
  }
}
