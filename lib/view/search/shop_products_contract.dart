import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_category.dart';
import 'package:pogo91/model/store_info_model.dart';
import 'package:pogo91/base/base_contract.dart';

abstract class SearchProductsContract extends BaseContract {
  void onProductsList(List<ProductsModel> productList);
}
