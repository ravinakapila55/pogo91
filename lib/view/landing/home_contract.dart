



import 'package:pogo91/model/business_type.dart';

abstract class HomeContract {
  void showContactList(List<BusinessType> items);
  void showError();
}