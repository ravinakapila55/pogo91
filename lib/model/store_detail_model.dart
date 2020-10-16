import 'package:pogo91/model/price_stock_model.dart';

class StoreDetailModel {
  String productDescription;
  List<String> imageUrl;
  String searchKeyword;
  String foodItem;
  int productId;
  List<PriceStockModel> priceStock;
  int unit;
  String barcode;
  bool allowBelowZero;
  String productName;
  int productType;
  bool trackInventory;

  StoreDetailModel(
      {this.productDescription,
      this.imageUrl,
      this.searchKeyword,
      this.foodItem,
      this.productId,
      this.priceStock,
      this.unit,
      this.barcode,
      this.allowBelowZero,
      this.productName,
      this.productType,
      this.trackInventory});

  StoreDetailModel.fromJson(Map<String, dynamic> json) {
    productDescription = json['product_description'];
    imageUrl = json['image_url'].cast<String>();
    searchKeyword = json['search_keyword'];
    foodItem = json['food_item'];
    productId = json['product_id'];
    if (json['price_stock'] != null) {
      priceStock = new List<PriceStockModel>();
      json['price_stock'].forEach((v) {
        priceStock.add(new PriceStockModel.fromMap(v));
      });
    }
    unit = json['unit'];
    barcode = json['barcode'];
    allowBelowZero = json['allow_below_zero'];
    productName = json['product_name'];
    productType = json['product_type'];
    trackInventory = json['track_inventory'];
  }
}
