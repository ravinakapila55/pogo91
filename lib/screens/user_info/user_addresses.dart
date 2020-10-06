import 'package:flutter/material.dart';
import 'package:pogo91/screens/user_info/component/user_addresses_body.dart';

class UserAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: UserAddressBody(),
    );
  }
}
