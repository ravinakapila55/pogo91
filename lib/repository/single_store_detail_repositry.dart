import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pogo91/di/injection.dart';
import 'package:pogo91/model/store_detail_model.dart';
import 'package:pogo91/service/network_service.dart';
import 'package:pogo91/util/api_endpoint.dart';
import 'package:pogo91/util/request_exception.dart';

abstract class SingleStoreDetailRepositry {
  Future<StoreDetailModel> fetchStoreInfo(String storeID);
}

class SingleStoreDetailRepositryImpl implements SingleStoreDetailRepositry {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<StoreDetailModel> fetchStoreInfo(String storeID) async {
    final response =
        await http.get(ApiEndPoint.STORE_SINGLE_DETAIL + storeID + "/");

    print(ApiEndPoint.STORE_SINGLE_DETAIL + storeID + "/");
    var statusCode = response.statusCode;

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    print(jsonDecode(response.body));
    return StoreDetailModel.fromJson(jsonDecode(response.body)['products']);
  }
}
