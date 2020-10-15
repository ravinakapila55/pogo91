import 'package:pogo91/repository/business_type_repository.dart';
import 'package:pogo91/repository/store_detail_repositry.dart';
import 'package:pogo91/repository/store_list_repositry.dart';
import 'package:pogo91/repository/store_search_product_repositry.dart';
import 'package:pogo91/service/network_service.dart';
import 'package:pogo91/view/store_list_selected/store_list_screen.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  BusinessTypeRepositry get usersRepository {
    return new BusinessTypeRepositryImpl();
  }

  StoreListRepositry get storesRepositry {
    return new StoreListRepositryImpl();
  }

  StoreDetailRepositry get getStoreInfoRepo {
    return new StoreDetailRepositryImpl();
  }

  StoreSearchProductRepositry get getSearchProducts {
    return new StoreSearchProductRepositryImpl();
  }

  NetworkService get networkService {
    return new NetworkService();
  }
}
