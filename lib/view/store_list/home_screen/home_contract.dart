


import 'package:pogo91/base/base_contract.dart';
import 'package:pogo91/model/business_type.dart';

abstract class HomeContract extends BaseContract {
  void onBusinessType(List<BusinessType> businessType);
}