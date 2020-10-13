import 'package:pogo91/model/business_type.dart';
import 'package:pogo91/repositry/home_shop_repositry.dart';

class HomeController {
  void getBusiness({String foodId, String message}) async {
    print("PA");
    final Stream<BusinessType> stream = await getBusinessType();
    stream.listen((BusinessType _food) {
      print(_food.name);
    }, onError: (a) {}, onDone: () {});
  }
}
