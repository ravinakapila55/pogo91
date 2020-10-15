import 'package:pogo91/model/price_stock_model.dart';

class ProductsModel {
  String productName;
  List<PriceStockModel> priceStock;
  String barcode;
  String searchKeyword;
  String productDescription;
  int productId;
  String imageUrl;
  bool allowBelowZero;
  bool trackInventory;
  PriceStockModel selectedPriceStock;
  ProductsModel(
      {this.productName,
      this.priceStock,
      this.barcode,
      this.searchKeyword,
      this.productDescription,
      this.productId,
      this.imageUrl,
      this.allowBelowZero,
      this.trackInventory});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    if (json['price_stock'] != null) {
      priceStock = new List<PriceStockModel>();
      json['price_stock'].forEach((v) {
        priceStock.add(new PriceStockModel.fromMap(v));
      });
    }
    barcode = json['barcode'];
    searchKeyword = json['search_keyword'];
    productDescription = json['product_description'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
    allowBelowZero = json['allow_below_zero'];
    trackInventory = json['track_inventory'];
  }
}
