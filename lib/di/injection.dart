import 'package:pogo91/repository/business_type_repository.dart';
import 'package:pogo91/repository/single_store_detail_repositry.dart';
import 'package:pogo91/repository/store_detail_repositry.dart';
import 'package:pogo91/repository/store_list_repositry.dart';
import 'package:pogo91/repository/store_search_product_repositry.dart';
import 'package:pogo91/service/network_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  BusinessTypeRepositry get usersRepository {
    return new BusinessTypeRepositryImpl();
  }

  SingleStoreDetailRepositry get storeSingleDetailRepo {
    return new SingleStoreDetailRepositryImpl();
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
