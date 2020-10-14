import 'package:pogo91/di/injection.dart';
import 'package:pogo91/repository/store_list_repositry.dart';
import 'package:pogo91/view/store_list_selected/store_list_contract.dart';

class StorePresenter {

 StoreListContract _view;
  StoreListRepositry _usersRepository;

  StorePresenter(this._view) {
    _usersRepository = new Injector().storesRepositry;
  }

  void loadStore(String id) {

    if (null == _view) return;

    _usersRepository
        .fetchStoreList(id)
        .then((stores) => _view.onStoreList(stores))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }

}
