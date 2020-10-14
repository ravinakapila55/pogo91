import 'package:flutter/material.dart';
import 'package:pogo91/model/business_type.dart';
import 'package:pogo91/utils/strings.dart';
import 'package:pogo91/view/store_list_selected/store_list_screen.dart';

class StoreBusinessType extends StatelessWidget {
  BusinessType businessType;
  StoreBusinessType({this.businessType});

// Navigator.push() context,

  //   MaterialPageRoute(builder: (context) => StoreList()),
  //),

  @override
  Widget build(BuildContext context) {
    return Material(
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
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      businessType.image != null ? businessType.image : "",
                      width: 55,
                      scale: 1.0,
                      height: 55,
                    ),
                  ),
                ),
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
