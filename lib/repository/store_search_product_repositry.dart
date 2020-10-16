import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pogo91/di/injection.dart';
import 'package:pogo91/model/product_model.dart';
import 'package:pogo91/model/store_category.dart';
import 'package:pogo91/model/store_info_model.dart';
import 'package:pogo91/service/network_service.dart';
import 'package:pogo91/util/api_endpoint.dart';
import 'package:pogo91/util/request_exception.dart';

abstract class StoreSearchProductRepositry {
  Future<List<ProductsModel>> fetchProductsList(String storeID, String search);
}

class StoreSearchProductRepositryImpl implements StoreSearchProductRepositry {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<ProductsModel>> fetchProductsList(
      String storeID, String search_keyword) async {
    final response = await http.get(ApiEndPoint.SEARCH_PRODUCTS +
        storeID +
        "&product_name=" +
        search_keyword);

    print(ApiEndPoint.SEARCH_PRODUCTS +
        storeID +
        "&product_name=" +
        search_keyword);
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
