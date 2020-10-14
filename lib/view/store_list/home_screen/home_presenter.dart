


import 'package:pogo91/di/injection.dart';
import 'package:pogo91/repository/business_type_repository.dart';
import 'package:pogo91/view/store_list/home_screen/home_contract.dart';

class HomePresenter {
  HomeContract _view;
  BusinessTypeRepositry _usersRepository;

  HomePresenter(this._view) {
    _usersRepository = new Injector().usersRepository;
  }

  void loadBusinessType() {

    if (null == _view) return;

    _usersRepository
        .fetchBusinessType()
        .then((listBusinessType) => _view.onBusinessType(listBusinessType))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }
}