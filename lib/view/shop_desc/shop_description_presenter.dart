import 'package:pogo91/di/injection.dart';
import 'package:pogo91/repository/store_detail_repositry.dart';
import 'package:pogo91/view/shop_desc/shop_description_contract.dart';

class ShopDescPresenter {
  ShopDescriptionContract _view;
  StoreDetailRepositry _usersRepository;

  ShopDescPresenter(this._view) {
    _usersRepository = new Injector().getStoreInfoRepo;
  }

  void loadStoreDetail(String storeID) {
    if (null == _view) return;

    _usersRepository
        .fetchStoreList(storeID)
        .then((listBusinessType) => _view.onStoreDetails(listBusinessType))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }

  void loadStoreCategory(String storeID) {
    if (null == _view) return;

    _usersRepository
        .fetchCategoryList(storeID)
        .then((listBusinessType) => _view.onCategoryList(listBusinessType))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }

  void loadProducts(String storeID, String categoryID) {
    if (null == _view) return;

    _usersRepository
        .fetchProductsList(storeID, categoryID)
        .then((listBusinessType) => _view.onProductsList(listBusinessType))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }
}
