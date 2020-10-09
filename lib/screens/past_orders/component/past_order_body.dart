import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: GreyBorderShadow().getBorderShow(
          borderColor: pastOrderBorderColor, solidColor: pastOrderSolidColor),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 0),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalTextField(
                      label: "Raju Kirana Store",
                      textSize: 14,
                      textColor: Colors.black,
                    ),
                    NormalTextField(
                      textAlign: TextAlign.end,
                      label: "Rejected",
                      textSize: 14,
                      textColor: Colors.black,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalTextField(
                      label: "July 12, 2020",
                      textSize: 14,
                      textColor: Colors.black,
                    ),
                    NormalTextField(
                      textAlign: TextAlign.end,
                      label: "₹228",
                      textSize: 14,
                      textColor: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
