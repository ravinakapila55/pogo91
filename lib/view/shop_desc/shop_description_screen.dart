import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/image_button.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_category.dart';
import 'package:pogo91/model/store_info_model.dart';
import 'package:pogo91/model/store_model.dart';
import 'package:pogo91/view/cart/cart_screen.dart';
import 'package:pogo91/view/shop_desc/cart_item.dart';
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
            child: Icon(Icons.rate_review, color: searchIconColor),
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
              automaticallyImplyLeading: true,
              elevation: 0,
              backgroundColor: greyLightColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: getHeader(),
              ),
              pinned: true,
            ),
            SliverPadding(
              padding: new EdgeInsets.all(2.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate([getCategory()]),
              ),
            ),
          ];
        },
        body: isNoProduct ? noProductWidget() : getProductsWidget(),
      ),
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
            border: Border(
              bottom: BorderSide(width: 1.0, color: greyLightColor),
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
    if (categoryList.length == 0) {
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
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
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
                ImageButton(iconData: Icons.search)
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
            child: ShoppingCartRow(
              productsModel: productList[index],
            ),
          );
        });
  }

  //<----------------No Product Found Widget------------------------->

  Widget noProductWidget() {
    return ListView(
      padding: EdgeInsets.only(right: 5.0, left: 5.0),
      scrollDirection: Axis.vertical,
      children: <Widget>[
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
        ),
      ],
    );
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
//categoryList[selectedCategoryPos].id.toString()

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

      if (productList.length == 0) {
        isNoProduct = true;
      } else {
        isNoProduct = false;
      }
    });
  }
}
