import 'package:flutter/material.dart';
import 'package:pogo91/view/register/component/background.dart';
import 'package:pogo91/view/store_list_selected/component/store_single_info_item.dart';

class StoreCartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      child: Column(
        children: [
          new Container(
            child: new ListView(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                StoreSingleInfoItem(
                  true,
                  isDeleteIconVisible: true,
                  isCallCart: true,
                ),
                StoreSingleInfoItem(
                  false,
                  isDeleteIconVisible: true,
                  isCallCart: true,
                ),
                StoreSingleInfoItem(
                  false,
                  isDeleteIconVisible: true,
                  isCallCart: true,
                ),
                StoreSingleInfoItem(
                  false,
                  isDeleteIconVisible: true,
                  isCallCart: true,
                ),
              ],
            ),
          )
        ],
      ),
    ));
    ;
  }
}
