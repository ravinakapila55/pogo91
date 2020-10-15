import 'package:pogo91/di/injection.dart';
import 'package:pogo91/repository/store_search_product_repositry.dart';
import 'package:pogo91/view/search/shop_products_contract.dart';

class SearchProductPresenter {
  SearchProductsContract _view;
  StoreSearchProductRepositry _usersRepository;
  Future<void> list;

  SearchProductPresenter(this._view) {
    _usersRepository = new Injector().getSearchProducts;
  }

  String searchProduct;
  void loadProducts(String storeID, String searchProduct) {
    if (null == _view) return;
    if (this.searchProduct == null || this.searchProduct != searchProduct) {
      this.searchProduct = searchProduct;
      if (list != null) {
        list.timeout(Duration(microseconds: 0));
        list = null;
      }
      list = _usersRepository
          .fetchProductsList(storeID, searchProduct)
          .then((listBusinessType) {
        if (this.searchProduct == searchProduct) {
          _view.onProductsList(listBusinessType);
        }
      }).catchError((onError) {
        print(onError);
        _view.showError(onError.toString());
      });
    }
  }
}
