import 'package:pogo91/model/price_stock_model.dart';

class ProductsModel {
  bool allow_below_zero;
  String image_url;
  int unit;
  int product_type;
  String product_name;
  String barcode;
  bool track_inventory;
  String food_item;
  String search_keyword;
  int product_id;
  List<PriceStockModel> price_stock;

  ProductsModel(
      {this.allow_below_zero,
      this.image_url,
      this.unit,
      this.product_type,
      this.product_name,
      this.barcode,
      this.track_inventory,
      this.food_item,
      this.search_keyword,
      this.product_id,
      this.price_stock});

  ProductsModel.fromMap(Map<String, dynamic> map)
      : allow_below_zero = map['allow_below_zero'] ?? '',
        image_url = map['image_url'] ?? '',
        unit = map['unit'],
        product_type = map['product_type'],
        product_name = map['product_name'],
        barcode = map['barcode'],
        track_inventory = map['track_inventory'],
        food_item = map['food_item'],
        search_keyword = map['search_keyword'],
        product_id = map['product_id'],
        price_stock = map['price_stock'].cast<PriceStockModel>();
}
