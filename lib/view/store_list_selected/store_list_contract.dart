import 'package:pogo91/base/base_contract.dart';
import 'package:pogo91/model/store_model.dart';

abstract class StoreListContract extends BaseContract{
 

  void onStoreList(List<StoreModel> businessType);

}
