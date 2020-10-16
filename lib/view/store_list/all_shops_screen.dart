import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pogo91/component/default_image.dart';
import 'package:pogo91/model/business_type.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class AllShops extends StatelessWidget {
  List<BusinessType> args;
  @override
  Widget build(BuildContext context) {
    if (args == null) {
      args = ModalRoute.of(context).settings.arguments;
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 10),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: args.length,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.white, child: allShopScreen(context, args[index])),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(1, index.isEven ? 1.2 : 1.2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 5.0,
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

  Widget allShopScreen(BuildContext context, BusinessType businessType) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            NAV_STORE_LIST,
            arguments: businessType,
          );
        },
        // handle your onTap here
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: DefaultImage()
                        .getImage(businessType.image, double.infinity, 40)),
              ),
              Container(
                width: 75,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  businessType.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontFamily: 'LatoRegular'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
