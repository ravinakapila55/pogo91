import 'package:flutter/material.dart';

class PastOrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        child: new ListView(
          padding: EdgeInsets.only(right: 20.0, left: 20.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            getPastOrderView(),
            getPastOrderView(),
            getPastOrderView(),
            getPastOrderView(),
          ],
        ),
      ),
    );
  }

  Widget getPastOrderView() {
    return null;
  }
}
