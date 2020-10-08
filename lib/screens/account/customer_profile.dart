import 'package:flutter/material.dart';
import 'package:pogo91/screens/account/component/customer_profile_body.dart';

class CustomerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomerProfileBody(),
      ),
    );
  }
}
