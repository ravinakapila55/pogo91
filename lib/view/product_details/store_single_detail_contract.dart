import 'package:pogo91/base/base_contract.dart';
import 'package:pogo91/model/store_detail_model.dart';

abstract class StoreSingleDetailContract extends BaseContract {
  void onSingleStoreInfo(StoreDetailModel model);
}
