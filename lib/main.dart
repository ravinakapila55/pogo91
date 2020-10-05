import 'package:flutter/material.dart';
import 'package:pogo91/screens/cart/shop_description.dart';
import 'package:pogo91/screens/store_list/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ShopDescription(),
    );
  }
}
