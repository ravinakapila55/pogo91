import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/screens/my_favorite_store/component/my_favorite_store_body.dart';

class MyFavoriteStoreScreen extends StatelessWidget {
  Function onBackPressed;
  MyFavoriteStoreScreen(@required this.onBackPressed);

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
            label: "My Favourite Stores",
            textColor: Colors.black,
          )),
      body: MyFovoriteStoreBody(),
    );
  }
}
