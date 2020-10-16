import 'package:pogo91/di/injection.dart';
import 'package:pogo91/repository/single_store_detail_repositry.dart';
import 'package:pogo91/view/product_details/store_single_detail_contract.dart';

class StoreSingleDetailPresenter {
  StoreSingleDetailContract _view;
  SingleStoreDetailRepositry _usersRepository;

  StoreSingleDetailPresenter(this._view) {
    _usersRepository = new Injector().storeSingleDetailRepo;
  }

  void loadStoreInfo(String storeId) {
    if (null == _view) return;

    _usersRepository
        .fetchStoreInfo(storeId)
        .then((listBusinessType) => _view.onSingleStoreInfo(listBusinessType))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }
}
