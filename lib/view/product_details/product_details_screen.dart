import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/component/simple_slider/simple_slider.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_detail_model.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/view/product_details/store_single_detail_contract.dart';
import 'package:pogo91/view/product_details/store_single_detail_presenter.dart';

class ProductDetailScreen extends StatefulWidget {
  _ProductScreen createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductDetailScreen>
    implements StoreSingleDetailContract {
  StoreSingleDetailPresenter _presenter;
  _ProductScreen() {
    _presenter = new StoreSingleDetailPresenter(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int selectedPos = 0;

  StoreDetailModel storeDetailModel;
  ProductsModel args;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (args == null) {
      args = ModalRoute.of(context).settings.arguments;

      _presenter.loadStoreInfo(args.productId.toString());
      ;
    }

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: getDetails(),
    );
  }

  Widget getDetails() {
    return SingleChildScrollView(
        child: storeDetailModel != null
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ImageSliderWidget(
                        imageUrls: storeDetailModel.imageUrl,
                        imageBorderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldRegular(
                            textSize: 17,
                            label: storeDetailModel.productName,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(5),
                            decoration: YellowSolidShadow().getDecoration(),
                            child: NormalTextField(
                              label:
                                  storeDetailModel.priceStock[selectedPos].name,
                              textSize: 14,
                              textColor: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                NormalTextField(
                                  label: "₹ " +
                                      storeDetailModel
                                          .priceStock[selectedPos].mrp,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: NormalTextField(
                                    label: "₹ " +
                                        storeDetailModel.priceStock[selectedPos]
                                            .selling_price,
                                    textColor: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: (storeDetailModel.productDescription !=
                                    null &&
                                storeDetailModel.productDescription.length !=
                                    0),
                            child: TextFieldRegular(
                              marginTop: 76,
                              label: storeDetailModel.productDescription,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 22),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NormalTextField(
                                      label: "Total Price",
                                      textColor: homeGreyColor,
                                      textSize: 12,
                                    ),
                                    NormalTextField(
                                      label: "₹" +
                                          storeDetailModel
                                              .priceStock[selectedPos]
                                              .selling_price,
                                      textColor: Colors.black,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 42,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: darkYellow,
                                    border: Border.all(color: darkYellow),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.0),
                                        topRight: Radius.circular(21),
                                        bottomRight: Radius.circular(21)),
                                  ),
                                  child: Row(
                                    children: [
                                      NormalTextField(
                                          label: "Add to Cart",
                                          textColor: Colors.white),
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 100),
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ));
  }

  @override
  void onSingleStoreInfo(StoreDetailModel model) {
    setState(() {
      for (int i = 0; i < model.priceStock.length; i++) {
        if (args.selectedPriceStock.id == model.priceStock[i].id) {
          selectedPos = i;
        }
      }
      storeDetailModel = model;
    });
  }

  @override
  void showError(String message) {}
}
