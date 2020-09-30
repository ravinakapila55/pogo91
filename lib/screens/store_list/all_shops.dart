import 'package:flutter/material.dart';
import 'package:pogo91/screens/store_list/component/store_category.dart';
import 'package:pogo91/screens/store_list/component/store_list_body.dart';

class AllShops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 160) / 4;
    final double itemWidth = size.width / 4;

    // TODO: implement build
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (itemWidth / itemHeight),
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: List.generate(30, (index) {
          return (Container(child: StoreCategory()));
        }),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "All Stores",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
    );
  }
}
