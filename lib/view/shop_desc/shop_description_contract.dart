import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_category.dart';
import 'package:pogo91/model/store_info_model.dart';
import 'package:pogo91/base/base_contract.dart';

abstract class ShopDescriptionContract extends BaseContract {
  void onStoreDetails(StoreInfoModel businessType);

  void onCategoryList(List<StoreCategoryModel> categoryList);

  void onProductsList(List<ProductsModel> productList);
}
