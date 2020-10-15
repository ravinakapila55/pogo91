import 'package:flutter/material.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBar.dart';
import 'package:pogo91/component/bottom_navigation_bar/FABBottomAppBarItem.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/model/price_stock_model.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/utils/box_decoration/edt_grey_decoration.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/view/search/search_product_presenter.dart';
import 'package:pogo91/view/search/shop_products_contract.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen_ createState() => SearchScreen_();
}

class SearchScreen_ extends State<SearchScreen>
    implements SearchProductsContract {
  TextEditingController _searchController = new TextEditingController();
  FocusNode _focusTextFocus = new FocusNode();

  SearchProductPresenter presenter;

  SearchScreen_() {
    presenter = new SearchProductPresenter(this);
    _searchController.addListener(onChange);
    _focusTextFocus.addListener(onChange);
  }

  //

  String searchText;
  void onChange() {
    String text = _searchController.text;
    if (searchText == null || searchText != text) {
      setState(() {
        isShimmer = true;
      });
    }
    this.searchText = text;
    if (text.length != 0) {
      presenter.loadProducts("14", text);
    } else {
      setState(() {
        productList.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          automaticallyImplyLeading: true, // Don't show the leading button
          titleSpacing: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NormalTextField(
                textColor: Colors.black,
                label: "Hi, Hitashi Garg",
                textSize: 13,
              ),
              NormalTextField(
                textColor: Colors.black,
                label: "C1-501, Cherry County, Tech Zone..",
                textSize: 13,
              )
              // Your widgets here
            ],
          ),

          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: getBody(),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                  color: Constants.yellow,
                ),
                child: Icon(Icons.photo_camera, size: 30),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: '',
          color: Colors.white,
          backgroundColor: Constants.yellow,
          selectedColor: Colors.white,
          items: [
            FABBottomAppBarItem(iconData: Icons.home),
            FABBottomAppBarItem(iconData: Icons.rate_review),
            FABBottomAppBarItem(iconData: Icons.create_new_folder),
            FABBottomAppBarItem(iconData: Icons.supervised_user_circle),
          ],
        ));
  }

  // <--------------Body ---------------------->

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            searchBar(),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: TextFieldRegular(
                label: recentlySearched,
                textColor: searchTextColor,
                textSize: 12,
              ),
            ),
            setupStoresWidget(),
          ],
        ),
      ),
    );
  }

  //<-------------Cart Products-------------->

  bool isShimmer = false;

  Widget setupStoresWidget() {
    if (isShimmer && _searchController.text.toString().length != 0) {
      return setupStoresShimmerWidget();
    } else if (_searchController.text.toString().length != 0 &&
        productList.length == 0) {
      return noProductWidget();
    } else {
      return getProductsWidget();
    }
  }

  Widget noProductWidget() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            icNoProducts,
            width: 100,
            height: 100,
          ),
          NormalTextField(label: "No Record Found")
        ],
      ),
    );
  }

  Widget setupStoresShimmerWidget() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
              color: homeLightGrey,
              border: Border.all(color: homeLightGrey),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        width: 70,
                        height: 70.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget getProductsWidget() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: getSingleProductWidget(
              productList[index],
            ),
          );
        });
  }

  Widget getSingleProductWidget(ProductsModel productsModel) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NAV_PRODUCT_DETAIL);
      },
      child: (Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: greyLightColor),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: 70,
              height: 70,
              child: Image.network(
                productsModel.imageUrl,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldRegular(
                      marginTop: 0,
                      label: productsModel.productName +
                          ", " +
                          productsModel.selectedPriceStock.name,
                      textSize: 13,
                    ),
                    getPriceStock(productsModel),
                    Container(
                        margin: EdgeInsets.only(top: 18),
                        child: Row(
                          children: [
                            Visibility(
                              visible: productsModel.priceStock[0].mrp !=
                                  productsModel.priceStock[0].selling_price,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: NormalTextField(
                                  label: "₹ " +
                                      productsModel.selectedPriceStock.mrp,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                            NormalTextField(
                              label: "₹ " +
                                  productsModel
                                      .selectedPriceStock.selling_price,
                              textColor: Colors.black,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              flex: 4,
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: yellow,
                        border: Border.all(color: yellow),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            icCartRemove,
                            width: 25,
                            height: 25,
                            color: Colors.white,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'LatoRegular'),
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Image.asset(
                            icCartAdd,
                            width: 25,
                            height: 25,
                            color: Colors.white,
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget getPriceStock(ProductsModel productsModel) {
    if (productsModel.priceStock.length > 1) {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(right: 15, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: GreyBorderShadow().getBorderShow(),

        // dropdown below..

        child: DropdownButton<PriceStockModel>(
            isExpanded: true,
            value: productsModel.selectedPriceStock,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 15,
            underline: Container(
              color: Colors.white,
            ),
            onChanged: (newValue) {
              setState(() {
                FocusScope.of(context).requestFocus(new FocusNode());
                productsModel.selectedPriceStock = newValue;
              });
            },
            style: new TextStyle(
              color: Colors.black,
            ),
            items: productsModel.priceStock
                .map<DropdownMenuItem<PriceStockModel>>(
                    (PriceStockModel model) {
              return DropdownMenuItem<PriceStockModel>(
                value: model,
                child: Container(
                  child: NormalTextField(
                    label: model.name,
                    maxLines: 1,
                    textSize: 11,
                    textColor: Colors.black,
                  ),
                ),
              );
            }).toList()),
      );
    } else {
      return Container();
    }
    ;
  }

  // Search View

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: EdtDecoration().getDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              focusNode: _focusTextFocus,
              style: new TextStyle(color: Colors.black, fontSize: 12),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: new Icon(Icons.search, color: searchIconColor),
                  hintText: "Search Product, Shops, Drinks",
                  hintStyle: new TextStyle(color: searchIconColor)),
            ),
            flex: 7,
          ),
          Expanded(
            child: Icon(
              Icons.camera,
              color: searchIconColor,
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  List<ProductsModel> productList = List();
  @override
  void onProductsList(List<ProductsModel> productList) {
    if (_searchController.text.length != 0) {
      for (int i = 0; i < productList.length; i++) {
        productList[i].selectedPriceStock = productList[i].priceStock[0];
      }
      setState(() {
        isShimmer = false;
        this.productList = productList;
      });
    }
  }

  @override
  void showError(String message) {}
}
