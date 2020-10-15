import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pogo91/di/injection.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_category.dart';
import 'package:pogo91/model/store_info_model.dart';
import 'package:pogo91/service/network_service.dart';
import 'package:pogo91/util/api_endpoint.dart';
import 'package:pogo91/util/request_exception.dart';

abstract class StoreDetailRepositry {
  Future<StoreInfoModel> fetchStoreList(String storeID);

  Future<List<StoreCategoryModel>> fetchCategoryList(String storeID);
  Future<List<ProductsModel>> fetchProductsList(
      String storeID, String categoryID);
}

class StoreDetailRepositryImpl implements StoreDetailRepositry {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<StoreInfoModel> fetchStoreList(String storeID) async {
    final response = await http.get(ApiEndPoint.STORE_DETAIL + storeID);
    var statusCode = response.statusCode;

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    print(jsonDecode(response.body));
    return StoreInfoModel.fromMap(
        jsonDecode(response.body)['store_details'][0]);
  }

  @override
  Future<List<StoreCategoryModel>> fetchCategoryList(String storeID) async {
    final response = await http.get(ApiEndPoint.STORE_CATEGORY + storeID);
    print(ApiEndPoint.STORE_CATEGORY + storeID);

    print(ApiEndPoint.STORE_CATEGORY + storeID);
    var statusCode = response.statusCode;
    var jsonBody = response.body;
    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }
    final contactsBody = _decoder.convert(jsonBody);
    final List contacts = contactsBody['category'];
    return contacts
        .map((stores) => new StoreCategoryModel.fromMap(stores))
        .toList();
  }

  @override
  Future<List<ProductsModel>> fetchProductsList(
      String storeID, String categoryID) async {
    final response = await http.get(
        ApiEndPoint.STORE_PRODUCTS + storeID + "&category_id=" + categoryID);
    print(ApiEndPoint.STORE_PRODUCTS + storeID + "&category_id=" + categoryID);
    var statusCode = response.statusCode;
    var jsonBody = response.body;
    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final contactsBody = _decoder.convert(jsonBody);
    final List contacts = contactsBody['products'];
    return contacts
        .map((stores) => new ProductsModel.fromJson(stores))
        .toList();
  }
}
