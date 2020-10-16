import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/component/default_image.dart';
import 'package:pogo91/component/image_button.dart';
import 'package:pogo91/model/price_stock_model.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_category.dart';
import 'package:pogo91/model/store_info_model.dart';
import 'package:pogo91/model/store_model.dart';
import 'package:pogo91/utils/box_decoration/grey_border_shadow.dart';
import 'package:pogo91/view/cart/cart_screen.dart';
import 'package:pogo91/view/shop_desc/products_category.dart';
import 'package:pogo91/view/shop_desc/shop_description_contract.dart';
import 'package:pogo91/view/shop_desc/shop_description_presenter.dart';
import 'package:pogo91/view/store_list/component/banner.dart';
import 'package:pogo91/utils/box_decoration/circle_grey_widget.dart';
import 'package:pogo91/utils/box_decoration/top_border_shadow.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';
import 'package:shimmer/shimmer.dart';

class ShopDescription extends StatefulWidget {
  ShopDescription_ createState() => ShopDescription_();
}

class ShopDescription_ extends State<ShopDescription>
    implements ShopDescriptionContract {
  int selectedCategoryPos = 0;
  String _address = "";
  ShopDescPresenter _presenter;

  ShopDescription_() {
    _presenter = new ShopDescPresenter(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  StoreModel args;

  bool isNoProduct = false;
  @override
  Widget build(BuildContext context) {
    if (args == null) {
      args = ModalRoute.of(context).settings.arguments;

      _presenter.loadStoreDetail(args.store_id.toString());
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(args.business_name,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'LatoBold')),
                ],
              ),
              flex: 1,
            )
            // Your widgets here
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.rate_review, color: Colors.black),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: headerView(),
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: greyLightColor,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  centerTitle: true,
                  title: getHeader(),
                ),
                pinned: true,
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                titleSpacing: 0,
                toolbarHeight: 40,
                backgroundColor: greyLightColor,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.all(0),
                  centerTitle: true,
                  title: getCategory(),
                ),
                pinned: true,
              ),
            ];
          },
          body: SafeArea(
            top: false,
            bottom: false,
            child: isNoProduct ? noProductWidget() : getProductsWidget(),
          )),
      bottomNavigationBar: Container(
        height: 65,
        decoration: TopBorderShadow().getBorderShow(),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.search),
                  NormalTextField(
                    label: "Sort",
                    textSize: 9,
                    textColor: Colors.black,
                  )
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  NormalTextField(
                    label: "Filter",
                    textSize: 9,
                    textColor: Colors.black,
                  )
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartProduct()),
                ), // handle your onTap here

                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalTextField(
                              label: "₹0",
                              textSize: 14,
                              textColor: Colors.white,
                            ),
                            NormalTextField(
                              label: "Checkout",
                              textSize: 9,
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  void onClickSearch(BuildContext context) {
    Navigator.pushNamed(
      context,
      NAV_SEARCH,
      arguments: infoStore.store_id.toString(),
    );
  }

//<------------------ Store Basis Info--------------------------->

//  Shimmer
  Widget shimmerHeader() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 200.0,
                  height: 25.0,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: 50.0,
                      height: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 25,
                    margin: EdgeInsets.only(left: 5),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        width: 50.0,
                        height: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 25,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    width: 50.0,
                    height: 25.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(right: 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: double.infinity,
                      height: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(right: 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: double.infinity,
                      height: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 25,
                  margin: EdgeInsets.only(right: 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: double.infinity,
                      height: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
        Container(
          color: greyLightColor,
          height: 120,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: ListView(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              BannerImage(),
              BannerImage(),
              BannerImage(),
              BannerImage(),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 25,
          margin: EdgeInsets.only(right: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              width: double.infinity,
              height: 30.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

// View
  Widget headerView() {
    if (infoStore == null) {
      print("SUCCESS");
      return shimmerHeader();
    } else {
      print("GAIDD");

      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    infoStore.address,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        color: loginButtonBlueColor,
                        fontFamily: 'LatoRegular'),
                  ),
                ),
                Row(
                  children: [
                    ImageButton(
                      iconData: Icons.gps_fixed,
                      marginRight: 5,
                      backGroundColor: greyButtonColor,
                    ),
                    ImageButton(
                      iconData: Icons.call,
                      marginRight: 5,
                      backGroundColor: greyButtonColor,
                    ),
                    ImageButton(
                      iconData: Icons.message,
                      backGroundColor: greyButtonColor,
                    )
                  ],
                )
              ],
            )),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    NormalTextField(
                      label: infoStore.rating.toString() + " ",
                      textSize: 8,
                      textColor: Colors.black,
                    ),
                    Image.asset(
                      kRatingImage,
                      width: 8,
                      height: 8,
                      color: yellow,
                    ),
                    NormalTextField(
                      label: " (" + infoStore.rating_count.toString() + ")",
                      textSize: 8,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                NormalTextField(
                  label: "More Info",
                  textSize: 8,
                  textColor: yellow,
                ),
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NormalTextField(
                  label: "Delivery in " + infoStore.delivery_in,
                  textSize: 8,
                  textColor: Colors.black,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleGreyDecoration().getRoundedWidget(),
                    NormalTextField(
                      label: "Free delivery above " + infoStore.minimum_order,
                      textSize: 8,
                      textColor: Colors.black,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleGreyDecoration().getRoundedWidget(),
                    NormalTextField(
                      label: infoStore.distance + " Away",
                      textSize: 8,
                      textColor: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: greyLightColor,
            height: 120,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ListView(
              padding: EdgeInsets.only(right: 5.0, left: 5.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                BannerImage(),
                BannerImage(),
                BannerImage(),
                BannerImage(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              "Earn 1 POGO Points for every ₹100 you spend",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: loginButtonBlueColor,
                  fontFamily: 'LatoRegular'),
            ),
            color: greenColor,
          )
        ],
      );
    }
  }

// Tab button or Categories of product
  Widget getCategory() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: categoryList.length != 0
                ? Border(
                    bottom: BorderSide(width: 1.0, color: greyLightColor),
                  )
                : Border(
                    bottom: BorderSide(width: 1.0, color: Colors.white),
                  ),
            color: Colors.white,
          ),
          height: 40,
          child: setupCategoriesViewWidget(),
        ),
      ],
    );
    //
  }

  //<------------- Set Category Tab-------------------->

  // Shimmer
  Widget setCategoriesTabShimmerWidget() {
    return Container(
      height: 10,
      child: ListView.builder(
          padding: EdgeInsets.only(right: 5.0, left: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
                height: 20,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    width: 70.0,
                    height: 30.0,
                    color: Colors.white,
                  ),
                ));
          }),
    );
  }

  // View

  Widget setupCategoriesViewWidget() {
    if (categoryList.length == 0 && !isNoProduct) {
      return setCategoriesTabShimmerWidget();
    }
    return Container(
      height: 140,
      child: ListView.builder(
          padding: EdgeInsets.only(right: 5.0, left: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
                onTap: () {
                  setState(() {
                    productList.clear();
                    isNoProduct = false;

                    selectedCategoryPos = index;
                    callProductsApi();
                  });
                },
                child: ProductCategroyTab(
                  isTabSelected: selectedCategoryPos == index,
                  storeCategoryModel: categoryList[index],
                ));
          }),
    );
  }

// Search bar
  Widget getHeader() {
    return Container(
        color: greyLightColor,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: NormalTextField(
                textColor: Colors.black,
                label: allCategories,
                textSize: 12,
              ),
            ),
            Row(
              children: [
                ImageButton(
                  iconData: Icons.scanner,
                  marginRight: 10,
                ),
                new GestureDetector(
                    onTap: () {
                      onClickSearch(context);
                    },
                    child: ImageButton(iconData: Icons.search))
              ],
            ),
          ],
        )));
  }

  //<-------------Cart Products-------------->

  Widget getProductsWidget() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: getSingleProductWidget(productList[index]),
          );
        });
  }

  //<----------------No Product Found Widget------------------------->

  Widget noProductWidget() {
    return ListView(physics: NeverScrollableScrollPhysics(), children: <Widget>[
      Container(
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
      )
    ]);
  }

  //<------ Price Stock--------------->

  Widget getSingleProductWidget(ProductsModel productsModel) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          NAV_PRODUCT_DETAIL,
          arguments: productsModel,
        );
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
              child: DefaultImage().getImageView(productsModel.imageUrl),
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
                    margin: EdgeInsets.only(right: 10, top: 10),
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

  StoreInfoModel infoStore;
  List<StoreCategoryModel> categoryList = List();

  @override
  void onStoreDetails(StoreInfoModel infoStore) {
    setState(() {
      this.infoStore = infoStore;
    });
    _presenter.loadStoreCategory(args.store_id.toString());
  }

  @override
  void showError(String message) {
    print(message);
  }

  @override
  void onCategoryList(List<StoreCategoryModel> categoryList) {
    print(categoryList.length.toString());
    setState(() {
      this.categoryList = categoryList;
      if (categoryList.length == 0) {
        isNoProduct = true;
      } else {
        isNoProduct = false;
      }
    });

    if (categoryList.length != 0) {
      _presenter.loadProducts(args.store_id.toString(),
          categoryList[selectedCategoryPos].id.toString());
    }
  }

  void callProductsApi() {
    if (categoryList.length != 0) {
      _presenter.loadProducts(args.store_id.toString(),
          categoryList[selectedCategoryPos].id.toString());
    }
  }

  List<ProductsModel> productList = List();
  @override
  void onProductsList(List<ProductsModel> productList) {
    setState(() {
      this.productList = productList;

      for (int i = 0; i < productList.length; i++) {
        productList[i].selectedPriceStock = productList[i].priceStock[0];
      }

      if (productList.length == 0) {
        isNoProduct = true;
      } else {
        isNoProduct = false;
      }
    });
  }
}
