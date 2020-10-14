import 'package:flutter/material.dart';
import 'package:pogo91/model/business_type.dart';

import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/view/store_list/component/store_business_type.dart';

class AllShops extends StatelessWidget {
  List<BusinessType> args;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 100) / 4;
    final double itemWidth = size.width / 4;

    if (args == null) {
      args = ModalRoute.of(context).settings.arguments;
    }

    // TODO: implement build
    return Scaffold(
      body: Container(
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: List.generate(args.length, (index) {
            return (Container(
                child: StoreBusinessType(
              businessType: args[index],
            )));
          }),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Shops",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'LatoBold')),
              ],
            )
            // Your widgets here
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: searchIconColor),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
    );
  }
}
